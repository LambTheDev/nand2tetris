{
  inputs = {
    naersk.url = "github:nix-community/naersk";
    nixpkgs.url = "nixpkgs";
  };

  outputs = { self, naersk, nixpkgs }:
    let 
      naersk' = pkgs.callPackage naersk {};
      pkgs = import nixpkgs { inherit system; };
      system = "x86_64-linux";
    in rec {
      devShells.${system} = rec {
        default = nand2tetris;
        nand2tetris = pkgs.mkShell {
          buildInputs = [
            pkgs.openjdk11
            packages.${system}.assembler
            packages.${system}.translator
          ];
          GTK_THEME = "Breeze:light";
          shellHook = ''
            export PATH="${self}/tools:$PATH"
          '';
        };
        rust = pkgs.mkShell {
          buildInputs = with pkgs; [
            # rust
            cargo
            rustPackages.clippy
            rustc
            rustfmt
          ];
          RUST_SRC_PATH = pkgs.rustPlatform.rustLibSrc;
        };
      };
      packages.${system} = {
        assembler = naersk'.buildPackage ./mytools/assembler;
        translator = naersk'.buildPackage ./mytools/translator;
      };
    };
}
