interface ToggleSwitchProps {
  enabled: boolean;
  onChange: (enabled: boolean) => void;
  disabled?: boolean;
  size?: 'sm' | 'md';
}

export default function ToggleSwitch({ enabled, onChange, disabled = false, size = 'md' }: ToggleSwitchProps) {
  const sizeClasses = size === 'sm'
    ? 'w-9 h-5'
    : 'w-11 h-6';

  const knobSizeClasses = size === 'sm'
    ? 'w-4 h-4'
    : 'w-5 h-5';

  const translateClasses = size === 'sm'
    ? (enabled ? 'translate-x-4' : 'translate-x-0.5')
    : (enabled ? 'translate-x-5' : 'translate-x-0.5');

  return (
    <button
      type="button"
      role="switch"
      aria-checked={enabled}
      disabled={disabled}
      onClick={(e) => {
        e.stopPropagation();
        if (!disabled) {
          onChange(!enabled);
        }
      }}
      className={`
        ${sizeClasses}
        relative inline-flex items-center rounded-full
        transition-all duration-200
        focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500
        ${enabled ? 'bg-green-500' : 'bg-slate-300'}
        ${disabled ? 'opacity-50 cursor-not-allowed' : 'cursor-pointer'}
      `}
    >
      <span
        className={`
          ${knobSizeClasses}
          ${translateClasses}
          inline-block rounded-full bg-white shadow-sm
          transition-transform duration-200
        `}
      />
    </button>
  );
}
