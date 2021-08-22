{ }:

let
  systemPkgs = import <nixpkgs> {};
  myLibs = import (systemPkgs.fetchFromGitHub {
    owner = "sutherlanda";
    repo = "nix-project";
    rev = "c8c1e5642d5da8ce2165f9a142ce9dcf8d20e06b";
    sha256 = "10c759m65wj3hwj03nfcs8rz0q6mvb3n8bvsk7b1yhipy5002m20";
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

