{ pkgs, inputs, ... }: {
  imports = [ ./settings.nix ./search.nix ./user ];
  programs.floorp = {
    enable = true;
    package = pkgs.floorp;
    languagePacks = [ "en" "ru" ];
    profiles.som = {
      id = 0;
      name = "som";
      isDefault = true;
      extensions = with inputs.firefox-addons.packages."${pkgs.system}"; [
        translate-web-pages
      ];
    };
    policies = {
      AllowFileSelectionDialogs = true;
      CaptivePortal = false;
			DisableFirefoxStudies = true;
			DisablePocket = true;
			DisableTelemetry = true;
			DisableFormHistory = true;
			DisplayBookmarksToolbar = false;
			DontCheckDefaultBrowser = true;
			DisableProfileRefresh = true;
			PromptForDownloadLocation = false;
			NetworkPrediction = false;
			showSearchBar = true;
			DisableSetDesktopBackground = true;
			LegacyProfiles = true;
			ManualAppUpdateOnly = true;
			DisableFirefoxScreenshots = true;
			HardwareAcceleration = true;
			FirefoxHome = {
			  Pocket = false;
			  Snippets = false;
			};
			SanitizeOnShutdown = {
			  Cache = true;
			  History = false;
			  Cookies = false;
			  Downloads = true;
			  FormData = true;
			  Sessions = true;
			  OfflineApps = true;
			};
			PasswordManagerEnabled = true;
    };
  };
}
