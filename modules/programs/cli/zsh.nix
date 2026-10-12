{ localPkgs, pkgs, ... }: {
  programs.zsh = {
    package = localPkgs.zsh-wrapped;
    enable = true;
    enableGlobalCompInit = false;
  };
}
