{ }:

let
  systemPkgs = import <nixpkgs> {};
  myLibs = import (systemPkgs.fetchFromGitHub {
    owner = "sutherlanda";
    repo = "nix-project";
    rev = "f30835fc907d9c06d91587af33aa22489e7cb082";
    sha256 = "10bb9swvcgixa8yvnxjwhqjsj5gpq9vi5lg3iva85ki75l7g1rr6";
  });
  #myLibs = import ../../nix-project/default.nix;
  pkgs = myLibs.config.pkgSet;
in
  rec {
    shell = myLibs.lib.mkShell {
      buildInputs = with pkgs; [ libiconv cargo rustc rust-analyzer rustfmt ]; 
      shellHook = ''
      '';
    };
  }

