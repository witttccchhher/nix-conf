{ w, ... }: {
  imports = w.umport {
    path = ./.;

    exclude = [
      ./default.nix
      ./theming
      ./services/xinetd.nix
    ];
  };
}
