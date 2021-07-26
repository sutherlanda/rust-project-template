{ }:

let
  systemPkgs = import <nixpkgs> {};
  myLibs = import (systemPkgs.fetchFromGitHub {
    owner = "sutherlanda";
    repo = "nix-project";
    rev = "37ae0a5e5f276abf52a27f759b5986be039b7501";
    sha256 = "058a91mmfcpl4px95rqcd92lv20d0w7f8miy9wixcwn0wxdpf1dj";
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

