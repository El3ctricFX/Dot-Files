#!/bin/bash

# Function to move files
move_files() {
    local src="$1"
    local dest="$2"
    local file_name="$3"

    if [ -e "$src/$file_name" ]; then
        echo "Moving $file_name from $src to $dest..."
        mv "$src/$file_name" "$dest"
    else
        echo "$file_name does not exist in $src."
    fi
}

# Function to prompt user
prompt_user() {
    read -p "$1 (y/n): " response
    if [[ "$response" == "y" ]]; then
        move_files "$2" "$3" "$4"
    fi
}

# Move config files and folders
prompt_user "Move nvim folder to ~/.config?" "/path/to/nvim" "$HOME/.config" "nvim"
prompt_user "Move i3 folder to ~/.config?" "/path/to/i3" "$HOME/.config" "i3"
prompt_user "Move rofi folder to ~/.config?" "/path/to/rofi" "$HOME/.config" "rofi"
prompt_user "Move waybar folder to ~/.config?" "/path/to/waybar" "$HOME/.config" "waybar"
prompt_user "Move starship.toml to ~/.config/starship.toml?" "/path/to/starship" "$HOME/.config" "starship.toml"
prompt_user "Move kitty folder to ~/.config?" "/path/to/kitty" "$HOME/.config" "kitty"
prompt_user "Move .bashrc to ~?" "/bash" "$HOME" ".bashrc"
prompt_user "Move .bash_aliases to ~?" "/bash" "$HOME" ".bash_aliases"
prompt_user "Move hypr folder to ~/.config?" "/path/to/hypr" "$HOME/.config" "hypr"

# Prompt for alacritty.toml
prompt_user "Move alacritty.toml to ~/.config?" "." "$HOME/.config" "alacritty.toml"

# Prompt for picom.conf
prompt_user "Move picom.conf to ~/.config?" "." "$HOME/.config" "picom.conf"

# Ask if the user wants to delete the Dot-Files directory
read -p "Do you want to delete the Dot-Files directory for leftover configs? (y/n): " delete_response
if [[ "$delete_response" == "y" ]]; then
    echo "Deleting the Dot-Files directory..."
    rm -rf ../Dot-Files
    echo "Dot-Files directory deleted."
else
    echo "Dot-Files directory not deleted."
fi

echo "Script completed."
