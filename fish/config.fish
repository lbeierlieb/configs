# PATH
fish_add_path /home/lu/.cargo/bin/

if status is-interactive
    # Commands to run in interactive sessions can go here

    # ABBREVIATIONS
    abbr --add gcl git clone
    abbr --add gco git checkout
    abbr --add ga git add
    abbr --add gcmsg git commit -m
    abbr --add gst git status
    abbr --add gp git push
    abbr --add gl git pull
    abbr --add lg lazygit

    abbr --add sco svn checkout
    abbr --add scm svn commit
    abbr --add scmsg svn commit -m
    abbr --add sup svn update

    abbr --add pas pass edit

    abbr --add syu sudo pacman -Syu
    abbr --add pac sudo pacman -S

    abbr --add l exa -lh
    abbr --add la exa -lah
    abbr --add cat bat

    abbr --add pw openssl rand -base64 20
    abbr --add vpn sudo openvpn ovpn/secloud-vpn.ovpn

    # FZF integration
    fzf_key_bindings

    # zoxide integration
    zoxide init fish | source
end
