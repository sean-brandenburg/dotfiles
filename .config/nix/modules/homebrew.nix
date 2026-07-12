{...}:
{
  homebrew = {
    enable = true;

    taps = [
      "homebrew/services"
    ];

    brews = [
      "gh"
      "n"
      "defaultbrowser"
      "mas"
      "mtools"
      "sesh"
      "nmap"
      "libyaml" # Ruby
      "gmp" # Ruby
      "pkg-config" # Ruby
      "go@1.24"
      "golangci-lint"
      "mongosh"
      "ollama"
      "whisper-cpp"
      "ffmpeg"
      "python@3.12"
      "sox"
      "herdr"
    ];

    casks = [
      "font-fira-code-nerd-font"
      "google-drive"
      "1password"
      "beeper"
      "ghostty"
      "scroll-reverser"
      "gpg-suite"
      "imageoptim"
      "anki"
      "claude"
      "claude-code"
      "docker"
      "logi-options+"
      "google-chrome"
      "protonvpn"
      "nextcloud"
      "mactex"
      "mongodb-compass"
      "spotify"
      "affinity-photo"
      "affinity-designer"
      "affinity-publisher"
    ];

    # Mac App Store Apps
    masApps = {
      "todoist" = 585829637;
      "kindle" = 302584613;
      "paprika" = 1303222628;
      "klack" = 6446206067;
      "toothfairy" = 1191449274;
      "final-cut-pro" = 424389933;
      "logic-pro" = 634148309;
      "tailscale" = 1475387142;
      "amphetamine" = 937984704;
    };
    onActivation = {
      upgrade = true;
      autoUpdate = true;
      cleanup = "zap"; 
    };
  };
}
