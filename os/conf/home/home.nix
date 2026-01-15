{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "piero";
  home.homeDirectory = "/home/piero/";

  # Import the scripts directory into the Nix store,
  # and recursively generate symbolic links in the Home directory pointing to the files in the store.
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  # xresources.properties = {
  #   "Xcursor.size" = 16;
  #   "Xft.dpi" = 172;
  # };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently

    neofetch
    nnn # terminal file manager
    yazi

    # archives
    tar
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "piero";
    userEmail = "<my@email.com>";
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.kitty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";
      font = {
        family = "CaskaydiaCove Nerd Font Mono";
        size = 14.0;
        bold = auto;
        italic = auto;
        bold_italic = auto;
      }
      opacity = 9.0;
    }
  }

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    zshrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      -="cd -"
      ...=../..
      ....=../../..
      .....=../../../..
      ......=../../../../..
      1="cd -1"
      2="cd -2"
      3="cd -3"
      4="cd -4"
      5="cd -5"
      6="cd -6"
      7="cd -7"
      8="cd -8"
      9="cd -9"
      _="sudo "
      bat=batcat
      cal="cal | cowsay -n | lolcat"
      clr=clear
      current_branch=$"\n    print -Pu2 "%F{yellow}[oh-my-zsh] \"%F{red}current_branch%F{yellow}\" is deprecated, using \"%F{green}git_current_branch%F{yellow}\" instead.%f"\n    git_current_branch"
      egrep="grep -E"
      fgrep="grep -F"
      g=git
      hybrid-sleep="systemctl hybrid-sleep"
      kvmoff="sudo rmmod kvm_amd && sudo rmmod kvm"
      l="ls -lah"
      la="ls -lAh"
      ll="ls -lh"
      ls="ls --color=tty"
      lsa="ls -lah"
      md="mkdir -p"
      poweroff="systemctl poweroff"
      python=python3
      rd=rmdir
      reboot="systemctl reboot"
      steam="   flatpak run com.valvesoftware.Steam "
      which-command=whence
      yasu="   flatpak run org.yuzu_emu.yuzu >/dev/null &"

      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };

}
