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
      "libyaml" # Ruby
      "gmp" # Ruby
      "pkg-config" # Ruby
      "go@1.24"
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
    ];

    # Mac App Store Apps
    masApps = {
      "todoist" = 585829637;
      "kindle" = 302584613;
      "affnity-photo" = 1616822987;
      "affnity-designer" = 1616831348;
      "affnity-publisher" = 1606941598;
      "paprika" = 1303222628;
      "klack" = 6446206067;
      "toothfairy" = 1191449274;
      "final-cut-pro" = 424389933;
      "logic-pro" = 634148309;
    };
    onActivation = {
      upgrade = true;
      autoUpdate = true;
      cleanup = "zap"; 
    };
  };
}
