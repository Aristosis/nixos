{
  pkgs,
  localPkgs,
  ...
}:
{
  imports = [
    ./zsh.nix
    ./direnv.nix
    ./nh.nix
  ];

  environment.systemPackages = with pkgs; [
    tmux
    btop
    duf
    localPkgs.fzf-wrapped
    p7zip
    unrar-wrapper
    lsd
    tree-sitter
    bat
    fd
    ripgrep
  ];

  programs = {
    zoxide.enable = true;

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    git = {
      enable = true;
      package = pkgs.gitFull;
      config = {
        init.defaultBranch = "main";
        user.email = "communeofstars@proton.me";
        user.name = "ari";
      };
    };
  };
}
