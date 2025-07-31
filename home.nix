{ config, pkgs, ... }:
{
  home.username = "aaditya"; # Replace with your actual username
  home.homeDirectory = "/home/aaditya"; # Replace with your home directory

  home.packages = with pkgs; [
    # User-specific CLI tools
    zsh
    bat
    fastfetch
    python3
    gcc
    unzip
    oh-my-zsh
  ];

  programs.git = {
    enable = true;
    userEmail = "aa3014429@gmail.com";
    userName = "ArrivedAditya";
    # You can also add other global Git configurations here
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "vim";
    };
  };

  programs.zsh.enable = true; # Example: Enable zsh

  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "robbyrussell";
  };

  # ... other Home-Manager options for dotfiles, services, etc.
  programs.home-manager.enable = true;
}
