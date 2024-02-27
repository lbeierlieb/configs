# PATH
fish_add_path /home/lu/.cargo/bin/

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

abbr --add syu sudo pacman -Syu
abbr --add pac sudo pacman -S
abbr --add pw openssl rand -base64 20


if status is-interactive
    # Commands to run in interactive sessions can go here
end
