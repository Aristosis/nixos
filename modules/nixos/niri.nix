{
  pkgs,
  localPkgs,
  ...
}:
{
  programs = {
    niri.enable = true;
    waybar.enable = true;
  };

  hjem.users.ari.packages = with pkgs; [
    localPkgs.fuzzel-character-picker
    localPkgs.kitty-wrapped
    localPkgs.fuzzel-wrapped
    mako
    awww
    wl-clipboard
    cliphist
    xwayland-satellite
    bibata-cursors
  ];

  environment.etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json".text =
    ''
      {
        "rules": [
        {
          "pattern": {
            "feature": "procname",
              "matches": "niri"
          },
            "profile": "Limit Free Buffer Pool On Wayland Compositors"
        }
        ],
          "profiles": [
          {
            "name": "Limit Free Buffer Pool On Wayland Compositors",
            "settings": [
            {
              "key": "GLVidHeapReuseRatio",
              "value": 0
            }
            ]
          }
          ]
      }
    '';
}
