import { useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';

export function usePageTracking() {
  const location = useLocation();
  const { user } = useAuth();

  useEffect(() => {
    const trackPageView = async () => {
      try {
        await supabase.from('page_views').insert({
          path: location.pathname,
          user_id: user?.id || null,
          user_role: user?.role || null,
          referrer: document.referrer || null,
          user_agent: navigator.userAgent,
        });
      } catch (error) {
        // Silently fail - don't break the app for tracking
        console.debug('Page tracking error:', error);
      }
    };

    trackPageView();
  }, [location.pathname, user?.id, user?.role]);
}
