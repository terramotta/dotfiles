# If not running interactively, exit script
[[ $- != *i* ]] && return

# Load custom bash configuration files
# These files will be sourced if they exist and are readable
for file in ~/.{bash_prompt,aliases,private}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
