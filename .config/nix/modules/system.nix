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
      trackpad.Clicking = true;
      WindowManager.EnableStandardClickToShowDesktop = false;

      NSGlobalDomain = {
        AppleScrollerPagingBehavior = true; # scroll to mouse when clicking scrollbar
        AppleInterfaceStyle = "Dark";  # dark mode
        InitialKeyRepeat = 10;
        KeyRepeat = 1;
      };

      dock = {
        autohide = true;
        autohide-time-modifier = 0.5;
        expose-group-apps = true;
        show-recents = false;

        persistent-apps = [
           "${pkgs.arc-browser}/Applications/Arc.app"
           "/Applications/Beeper.app"
           "/System/Applications/Messages.app"
           "${pkgs.spotify}/Applications/Spotify.app"
           "/Applications/Ghostty.app"
           "${pkgs.obsidian}/Applications/Obsidian.app"
           "/Applications/1Password.app"
           "/System/Applications/System Settings.app"
        ];
      };

      finder = {
        _FXShowPosixPathInTitle = true;  # show full path in finder title
        FXEnableExtensionChangeWarning = false;  # disable warning when changing file extension
        AppleShowAllExtensions = true;
        AppleShowAllFiles= true; # show hidden files
        FXPreferredViewStyle = "clmv"; # column view in finder
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      controlcenter = {
        BatteryShowPercentage = false;
        Bluetooth = true;
      };

    };

    activationScripts.postUserActivation.text = ''
      # Set default browser to arc
      /opt/homebrew/bin/defaultbrowser browser

      # Set default Rust version
      rustup default stable

      # Set not version
      sudo /opt/homebrew/bin/n 22
    '';
  };
}
