import { useState, useEffect } from 'react';
import { Link, useNavigate, useParams } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase } from '../../lib/supabase';

interface Store {
  id: number;
  name: string;
}

const PRESET_TAGS = ['팁', '질문', '후기', '정보', '잡담'];

export default function WriteInfoPost() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const { id } = useParams<{ id: string }>();
  const isEditMode = !!id;

  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');
  const [tags, setTags] = useState<string[]>([]);
  const [tagInput, setTagInput] = useState('');
  const [storeId, setStoreId] = useState<number | null>(null);
  const [selectedStore, setSelectedStore] = useState<Store | null>(null);
  const [storeSearch, setStoreSearch] = useState('');
  const [storeResults, setStoreResults] = useState<Store[]>([]);
  const [showStoreResults, setShowStoreResults] = useState(false);
  const [isAnonymous, setIsAnonymous] = useState(false);
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);

  useEffect(() => {
    if (isEditMode && user) {
      fetchPost();
    } else {
      setLoading(false);
    }
  }, [id, user]);

  useEffect(() => {
    const searchStores = async () => {
      if (storeSearch.length < 2) {
        setStoreResults([]);
        return;
      }

      const { data } = await supabase
        .from('stores')
        .select('id, name')
        .ilike('name', `%${storeSearch}%`)
        .limit(10);

      setStoreResults(data || []);
    };

    const debounce = setTimeout(searchStores, 300);
    return () => clearTimeout(debounce);
  }, [storeSearch]);

  const fetchPost = async () => {
    if (!id || !user) return;

    const { data, error } = await supabase
      .from('info_posts')
      .select('*, store:stores(id, name)')
      .eq('id', parseInt(id))
      .eq('author_id', user.id)
      .single();

    if (error || !data) {
      alert('게시글을 찾을 수 없습니다.');
      navigate('/staff/community/board');
      return;
    }

    setTitle(data.title);
    setContent(data.content);
    setTags(data.tags || []);
    setStoreId(data.store_id);
    if (data.store) {
      setSelectedStore(data.store as unknown as Store);
    }
    setIsAnonymous(data.is_anonymous);
    setLoading(false);
  };

  const selectStore = (store: Store) => {
    setStoreId(store.id);
    setSelectedStore(store);
    setStoreSearch('');
    setShowStoreResults(false);
  };

  const clearStore = () => {
    setStoreId(null);
    setSelectedStore(null);
  };

  const addTag = (tag: string) => {
    const trimmed = tag.trim();
    if (trimmed && !tags.includes(trimmed) && tags.length < 5) {
      setTags([...tags, trimmed]);
    }
    setTagInput('');
  };

  const removeTag = (tagToRemove: string) => {
    setTags(tags.filter(t => t !== tagToRemove));
  };

  const handleTagKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter' || e.key === ',') {
      e.preventDefault();
      addTag(tagInput);
    }
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!user) return;

    if (title.length < 2) {
      alert('제목은 최소 2자 이상 입력해주세요.');
      return;
    }

    if (content.length < 10) {
      alert('내용은 최소 10자 이상 작성해주세요.');
      return;
    }

    setSubmitting(true);

    if (isEditMode) {
      const { error } = await supabase
        .from('info_posts')
        .update({
          title,
          content,
          tags,
          store_id: storeId,
          is_anonymous: isAnonymous
        })
        .eq('id', parseInt(id!));

      if (error) {
        alert('수정 중 오류가 발생했습니다.');
        setSubmitting(false);
        return;
      }

      alert('게시글이 수정되었습니다.');
      navigate(`/staff/community/board/${id}`);
    } else {
      const { data, error } = await supabase
        .from('info_posts')
        .insert({
          author_id: user.id,
          title,
          content,
          tags,
          store_id: storeId,
          is_anonymous: isAnonymous
        })
        .select()
        .single();

      if (error) {
        alert('작성 중 오류가 발생했습니다.');
        setSubmitting(false);
        return;
      }

      // 포인트 지급
      const { data: pointResult } = await supabase.rpc('award_writing_points', {
        p_user_id: user.id,
        p_type: 'info_post'
      });

      const pointMessage = pointResult?.[0]?.message || '';
      alert(`게시글이 작성되었습니다.${pointMessage ? '\n' + pointMessage : ''}`);
      navigate(`/staff/community/board/${data.id}`);
    }
  };

  if (loading) {
    return <div className="text-slate-500">로딩 중...</div>;
  }

  return (
    <div>
      <Link to="/staff/community/board" className="inline-block mb-4 text-orange-600 text-sm hover:underline">← 자유게시판</Link>

      <h1 className="text-2xl font-bold text-slate-900 mb-6">
        {isEditMode ? '글 수정' : '글쓰기'}
      </h1>

      <form onSubmit={handleSubmit} className="flex flex-col gap-6">
        {/* Tags */}
        <div>
          <label className="block text-sm font-medium text-slate-700 mb-2">태그 (최대 5개)</label>
          <div className="flex gap-2 flex-wrap mb-2">
            {PRESET_TAGS.filter(t => !tags.includes(t)).map((tag) => (
              <button
                key={tag}
                type="button"
                onClick={() => addTag(tag)}
                className="px-3 py-1 text-xs font-medium rounded-full bg-slate-100 text-slate-600 hover:bg-slate-200 transition-colors"
              >
                + {tag}
              </button>
            ))}
          </div>
          <div className="flex flex-wrap gap-2 mb-2">
            {tags.map((tag) => (
              <span
                key={tag}
                className="inline-flex items-center gap-1 px-3 py-1 text-xs font-medium rounded-full bg-red-100 text-red-600"
              >
                #{tag}
                <button
                  type="button"
                  onClick={() => removeTag(tag)}
                  className="hover:text-red-800"
                >
                  ×
                </button>
              </span>
            ))}
          </div>
          <input
            type="text"
            value={tagInput}
            onChange={(e) => setTagInput(e.target.value)}
            onKeyDown={handleTagKeyDown}
            onBlur={() => tagInput && addTag(tagInput)}
            placeholder="직접 입력 후 Enter"
            className="w-full px-4 py-2 border border-slate-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-red-500"
            disabled={tags.length >= 5}
          />
        </div>

        {/* Store Tag */}
        <div>
          <label className="block text-sm font-medium text-slate-700 mb-2">가게 태그 (선택)</label>
          {selectedStore ? (
            <div className="flex items-center gap-2 px-4 py-3 border border-slate-200 rounded-lg bg-slate-50">
              <span className="flex-1 text-slate-700">@{selectedStore.name}</span>
              <button
                type="button"
                onClick={clearStore}
                className="text-slate-400 hover:text-slate-600"
              >
                ×
              </button>
            </div>
          ) : (
            <div className="relative">
              <input
                type="text"
                value={storeSearch}
                onChange={(e) => {
                  setStoreSearch(e.target.value);
                  setShowStoreResults(true);
                }}
                onFocus={() => setShowStoreResults(true)}
                onBlur={() => setTimeout(() => setShowStoreResults(false), 200)}
                placeholder="가게 이름 검색 (2글자 이상)"
                className="w-full px-4 py-3 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-500"
              />
              {showStoreResults && storeResults.length > 0 && (
                <div className="absolute z-10 w-full mt-1 bg-white border border-slate-200 rounded-lg shadow-lg max-h-48 overflow-y-auto">
                  {storeResults.map((store) => (
                    <button
                      key={store.id}
                      type="button"
                      onClick={() => selectStore(store)}
                      className="w-full px-4 py-2 text-left text-sm hover:bg-slate-50 border-b border-slate-100 last:border-b-0"
                    >
                      {store.name}
                    </button>
                  ))}
                </div>
              )}
            </div>
          )}
          <p className="text-xs text-slate-500 mt-1">특정 가게에 대한 글이면 태그해주세요</p>
        </div>

        {/* Title */}
        <div>
          <label className="block text-sm font-medium text-slate-700 mb-2">제목</label>
          <input
            type="text"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            placeholder="제목을 입력하세요 (최소 2자)"
            className="w-full px-4 py-3 border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-500"
            required
            minLength={2}
          />
        </div>

        {/* Content */}
        <div>
          <label className="block text-sm font-medium text-slate-700 mb-2">내용</label>
          <textarea
            value={content}
            onChange={(e) => setContent(e.target.value)}
            placeholder="내용을 입력하세요 (최소 10자)"
            className="w-full px-4 py-3 border border-slate-200 rounded-lg resize-none focus:outline-none focus:ring-2 focus:ring-red-500"
            rows={10}
            required
            minLength={10}
          />
          <p className="text-xs text-slate-500 mt-1">{content.length}/10 (최소 10자)</p>
        </div>

        {/* Anonymous Toggle */}
        <label className="flex items-center gap-3 cursor-pointer">
          <input
            type="checkbox"
            checked={isAnonymous}
            onChange={(e) => setIsAnonymous(e.target.checked)}
            className="w-4 h-4 text-red-600 rounded focus:ring-red-500"
          />
          <span className="text-sm text-slate-700">익명으로 작성</span>
        </label>
        <p className="text-xs text-slate-500 -mt-4">
          {isAnonymous
            ? '작성자 이름이 "익명"으로 표시됩니다.'
            : `작성자 이름이 "${user?.name}"으로 표시됩니다.`}
        </p>

        {/* Submit */}
        <button
          type="submit"
          disabled={submitting}
          className="w-full py-3 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors disabled:bg-slate-300 disabled:cursor-not-allowed"
        >
          {submitting
            ? '처리 중...'
            : isEditMode ? '수정하기' : '작성하기'}
        </button>
      </form>
    </div>
  );
}
