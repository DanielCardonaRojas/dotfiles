
#  https://gist.github.com/mandrean/65108e0898629e20afe1002d8bf4f223
# Install nix package manager
sudo curl -L https://nixos.org/nix/install | sh

# Install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixpkgs-unstable

cat ~/.config/nixpkgs/home.template.nix | sed -E -e "s|HOME_VAR|${HOME}|g" -e  "s|USER_VAR|${USER}|g" > ~/.config/nixpkgs/home.nix

nix-channel --update

nix-shell '<home-manager>' -A install
