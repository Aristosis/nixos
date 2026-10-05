{
  pkgs,
  ...
}:
{
  imports = [
    ./cli
    ./theming
    ./librewolf.nix
    ./pavucontrol-helvum.nix
    ./syncthing.nix
    ./obsidian.nix
    ./games
  ];
  programs = {
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        icu
        alsa-lib
        libGL
        libice
        libsm
        libx11
        libxcursor
        libxext
        libxi
        libxinerama
        libxrandr
        libpulseaudio
        libxkbcommon
        wayland
      ];
    };
  };
}
