{
  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      devShell.x86_64-linux =
        pkgs.mkShell {
          buildInputs = with pkgs; [
            openjdk11
          ];
          GTK_THEME = "Breeze:light";
          shellHook = ''
            export PATH="${self}/tools:$PATH"
          '';
        };
    };
}
