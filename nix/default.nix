{ }:

let
  systemPkgs = import <nixpkgs> {};
  myLibs = import (systemPkgs.fetchFromGitHub {
    owner = "sutherlanda";
    repo = "nix-project";
    rev = "25fc890cd5615045bd712547fa448ba23e599692";
    sha256 = "1x6mav09l2xjf0p5rqgr3r7g4mbis47bxf9wfr5yxgfjk5i29k7m";
  });
  # myLibs = import ../../nix-project/default.nix;
  pkgs = myLibs.config.pkgSet;
in
  rec {
    shell = myLibs.lib.mkShell {
      buildInputs = with pkgs; [ libiconv cargo rustc ];
      shellHook = ''
      '';
    };
  }

