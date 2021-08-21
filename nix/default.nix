{ }:

let
  systemPkgs = import <nixpkgs> {};
  myLibs = import (systemPkgs.fetchFromGitHub {
    owner = "sutherlanda";
    repo = "nix-project";
    rev = "9f9f2cbfa5364f3e44590e9e676c9f84689d16ce";
    sha256 = "0paf606cylssc068yf7i3dqw1g3iflzvz6wb98lj3mapk5x1wvq8";
  });
  # myLibs = import ../../nix-project/default.nix;
  pkgs = myLibs.config.pkgSet;
in
  rec {
    shell = myLibs.lib.mkShell {
      buildInputs = with pkgs; [ libiconv cargo rustc rust-analyzer rustfmt ]; 
      shellHook = ''
      '';
    };
  }

