{ pkgs, ...}:
{
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    primaryUser="sean";
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

        persistent-others = []; # Remove downloads folder from dock
        persistent-apps = [
           "/Applications/1Password.app"
           "${pkgs.arc-browser}/Applications/Arc.app"
           "/Applications/Todoist.app"
           "/Applications/Beeper.app"
           "${pkgs.obsidian}/Applications/Obsidian.app"
           "/Applications/Ghostty.app"
           "/System/Applications/Messages.app"
           "${pkgs.spotify}/Applications/Spotify.app"
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
      userSetup.text = ''
        # Set default browser to arc
        sudo -u sean /opt/homebrew/bin/defaultbrowser browser

        # Set default Rust version
        sudo -u sean rustup default stable

        # Set node version (uses sudo internally)
        sudo -u sean /opt/homebrew/bin/n 22
      '';
    };
  };
}
