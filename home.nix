{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "kanit";
  home.homeDirectory = "/home/kanit";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = [
    pkgs.nodejs
    pkgs.fish
    pkgs.fishPlugins.hydro
    pkgs.go
    pkgs.nixpkgs-fmt
    pkgs.tmux
    pkgs.tmuxinator
    pkgs.dotnet-sdk_8
    pkgs.elixir
    pkgs.erlang
    pkgs.rofi
    pkgs.neovim
    pkgs.lazygit
    pkgs.ripgrep
    pkgs.nodePackages.pnpm
    pkgs.cargo
    pkgs.rustc
    pkgs.pywal
  ];

  home.sessionPath =
    [ "$HOME/go/bin" ];

  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./fish/config.fish;
    plugins = [
      {
        name = "nix-env";
        src = pkgs.fetchFromGitHub {
          owner = "lilyball";
          repo = "nix-env.fish";
          rev = "00c6cc762427efe08ac0bd0d1b1d12048d3ca727";
          sha256 = "1hrl22dd0aaszdanhvddvqz3aq40jp9zi2zn0v1hjnf7fx4bgpma";
        };
      }
    ];
  };

  home.activation = {
    tmuxInitialize = "";
  };
}
