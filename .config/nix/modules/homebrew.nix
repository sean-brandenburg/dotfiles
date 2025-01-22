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
      "go@1.22"
    ];

    casks = [
      "1password"
      "beeper"
      "ghostty"
      "scroll-reverser"
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
