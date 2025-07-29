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

# Neovim config
  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
  ];

  programs.neovim = {
    enable = true;
    # Set the package to the nightly version from the overlay
    package = pkgs.neovim-nightly;

    # Optional: Configure Neovim here directly using `extraConfig` or `extraLuaConfig`
    # For example, to set some basic options:
    # extraConfig = ''
    #  set number
    #  set relativenumber
    #  set expandtab
    #  set tabstop=2
    #  set shiftwidth=2
    #'';

    # Or to link your existing Lua configuration
    # home.file.".config/nvim".source = ./path/to/your/nvim/config;

    # You can also define plugins here if you want to manage them with Home Manager
    # plugins = with pkgs.vimPlugins; [
    #   nvim-treesitter
    #   nvim-lspconfig
    #   plenary-nvim
    # ];
  };

  programs.bash.enable = true; # Example: Enable zsh
  # ... other Home-Manager options for dotfiles, services, etc.
  programs.home-manager.enable = true;
}
