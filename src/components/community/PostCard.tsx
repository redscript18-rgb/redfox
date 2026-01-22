import { Link } from 'react-router-dom';

interface PostCardProps {
  post: {
    id: number;
    author_id: string;
    title: string;
    content: string;
    tags?: string[];
    store_id?: number | null;
    is_anonymous: boolean;
    view_count: number;
    created_at: string;
    author?: { name: string };
    store?: { name: string };
    comment_count?: number;
    like_count?: number;
  };
  currentUserId?: string;
  onDelete?: (id: number) => void;
}

export default function PostCard({ post, currentUserId, onDelete }: PostCardProps) {
  const isAuthor = currentUserId === post.author_id;

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr);
    const now = new Date();
    const diff = now.getTime() - date.getTime();
    const minutes = Math.floor(diff / 60000);
    const hours = Math.floor(minutes / 60);
    const days = Math.floor(hours / 24);

    if (minutes < 1) return '방금 전';
    if (minutes < 60) return `${minutes}분 전`;
    if (hours < 24) return `${hours}시간 전`;
    if (days < 7) return `${days}일 전`;

    return `${date.getMonth() + 1}/${date.getDate()}`;
  };

  const handleDelete = (e: React.MouseEvent) => {
    e.preventDefault();
    if (confirm('이 게시글을 삭제하시겠습니까?')) {
      onDelete?.(post.id);
    }
  };

  return (
    <Link
      to={`/staff/community/board/${post.id}`}
      className="block p-4 bg-white border border-slate-200 rounded-xl hover:border-slate-300 transition-colors"
    >
      <div className="flex items-center gap-2 mb-2 flex-wrap">
        {post.tags && post.tags.length > 0 && post.tags.map((tag) => (
          <span key={tag} className="px-2 py-0.5 text-xs font-medium rounded bg-red-100 text-red-600">
            #{tag}
          </span>
        ))}
        {post.store && (
          <span className="px-2 py-0.5 text-xs font-medium rounded bg-purple-100 text-purple-600">
            @{post.store.name}
          </span>
        )}
        <span className="text-xs text-slate-400">{formatDate(post.created_at)}</span>
      </div>

      <h3 className="font-semibold text-slate-900 mb-1 line-clamp-1">{post.title}</h3>
      <p className="text-sm text-slate-500 line-clamp-1 mb-3">{post.content}</p>

      <div className="flex items-center justify-between text-xs text-slate-400">
        <div className="flex items-center gap-3">
          <span>{post.is_anonymous ? '익명' : post.author?.name || '알 수 없음'}</span>
          <span>조회 {post.view_count}</span>
          {post.like_count !== undefined && post.like_count > 0 && (
            <span className="text-red-500">♥ {post.like_count}</span>
          )}
          {post.comment_count !== undefined && post.comment_count > 0 && (
            <span className="text-orange-500">댓글 {post.comment_count}</span>
          )}
        </div>

        {isAuthor && (
          <div className="flex gap-2" onClick={(e) => e.stopPropagation()}>
            <Link
              to={`/staff/community/board/${post.id}/edit`}
              className="text-slate-500 hover:text-slate-700"
              onClick={(e) => e.stopPropagation()}
            >
              수정
            </Link>
            <button
              onClick={handleDelete}
              className="text-red-500 hover:text-red-700"
            >
              삭제
            </button>
          </div>
        )}
      </div>
    </Link>
  );
}
