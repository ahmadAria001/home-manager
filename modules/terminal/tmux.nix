{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = ''
      set -g mouse on
      set-option -g terminal-overrides 'tmux-256color'
      set -g renumber-windows on
      set-option -ga terminal-overrides ',*:allow-passthrough=1'
    '';
    plugins = with pkgs.tmuxPlugins; [ 
      copy-toolkit
      urlview
      tmux-thumbs
      online-status
      better-mouse-mode
      {
	  plugin = catppuccin;
	  extraConfig = '' 
	  set -g @catppuccin_flavour 'mocha'
	  set -ogq @catppuccin_window_status_style "rounded"

	  set -g status-right-length 100
	  set -g status-left-length 100
	  set -g status-left ""
	  set -g status-right "#{E:@catppuccin_status_application}"
	  set -agF status-right "#{E:@catppuccin_status_cpu}"
	  set -ag status-right "#{E:@catppuccin_status_session}"
	  set -ag status-right "#{E:@catppuccin_status_uptime}"
	  set -agF status-right "#{E:@catppuccin_status_battery}"

	  set -g @catppuccin_window_tabs_enabled on
	  set -g @catppuccin_date_time "%H:%M"
	  '';
      }
      {
	  plugin = resurrect;
	  extraConfig = ''
	  set -g @resurrect-strategy-vim 'session'
	  set -g @resurrect-strategy-nvim 'session'
	  set -g @resurrect-capture-pane-contents 'on'
	  '';
      }
      {
	  plugin = continuum;
	  extraConfig = ''
	  set -g @continuum-restore 'on'
	  set -g @continuum-boot 'on'
	  set -g @continuum-save-interval '10'
	  '';
      }

      cpu
      battery
    ];
    baseIndex = 1;
    newSession = true;
    historyLimit = 1000;
    escapeTime = 0;
    secureSocket = true;
    sensibleOnTop = true;
    terminal = "tmux-256color";
    tmuxinator = {
      enable = true;
    };
  };
}
