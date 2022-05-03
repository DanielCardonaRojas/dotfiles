echo "Removing old nvim config"
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

echo "Cloning custom NvChad config"

git clone https://github.com/DanielCardonaRojas/NvChad ~/.config/nvim --branch custom_config_1 --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
