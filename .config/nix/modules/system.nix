{ pkgs, ...}:
{
  security.pam.enableSudoTouchIdAuth = true;

  system = {
    stateVersion = 5; # Check `darwin-rebuild changelog` before changing

    keyboard = {
      remapCapsLockToEscape = true;
      enableKeyMapping = true;
    };

    defaults = {
      screencapture.location = "~/Pictures/screenshots";
      loginwindow.GuestEnabled = false;
      WindowManager.EnableStandardClickToShowDesktop = false;

      NSGlobalDomain = {
        ApplePressAndHoldEnabled = false;
        AppleScrollerPagingBehavior = true; # scroll to mouse when clicking scrollbar
        AppleInterfaceStyle = "Dark";
      };

      dock = {
        autohide = true;
        autohide-time-modifier = 0.5;
        expose-group-apps = true;
        show-recents = false;
        wvous-br-corner = 1; # disable bottom right hot corner
        tilesize = 48; # smaller dock size

        persistent-apps = [
           "${pkgs.arc-browser}/Applications/Arc.app"
           "/Applications/Beeper.app"
           "/System/Applications/Messages.app"
           "${pkgs.spotify}/Applications/Spotify.app"
           "/Applications/Ghostty.app"
           "${pkgs.obsidian}/Applications/Obsidian.app"
           "/Applications/Todoist.app"
           "/Applications/1Password.app"
           "/System/Applications/System Settings.app"
        ];
      };

      finder = {
        _FXSortFoldersFirst = true; # folders always appear before files
        _FXShowPosixPathInTitle = true;  # show full path in finder title
        FXEnableExtensionChangeWarning = false;  # disable warning when changing file extension
        AppleShowAllExtensions = true;
        AppleShowAllFiles= true; # show hidden files
        FXPreferredViewStyle = "clmv"; # column view in finder
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
        FirstClickThreshold = 0;
      };

      controlcenter = {
        BatteryShowPercentage = false;
        Bluetooth = true;
      };

    };

    activationScripts = {
      postUserActivation.text = ''
        # Set default browser to arc
        /opt/homebrew/bin/defaultbrowser browser

        # Set default Rust version
        rustup default stable

        # Set node version
        sudo /opt/homebrew/bin/n 22
      '';
    };
  };
}
