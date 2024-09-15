#!/bin/bash

# Função para instalar aplicativos e ferramentas
function install_apps {
    echo "Instalando aplicativos e ferramentas essenciais..."

    # Atualizar o repositório
    sudo apt update

    # Instalar aplicativos adicionais via APT
    echo "Instalando aplicativos adicionais via APT..."
    apt_apps=(
        "google-chrome-stable"
        "brave-browser"
        "sublime-text"
        "visual-studio-code"
        "postman"       # Pode precisar de um repositório adicional
        "keyboardcleaner"  # Verifique a disponibilidade
    )
    sudo apt install -y "${apt_apps[@]}"

    # Instalar ferramentas de desenvolvimento via APT
    echo "Instalando ferramentas de desenvolvimento via APT..."
    dev_tools=(
        "python"
        "tcl-tk"
        "python-tk"
        "bash"
        "zsh"
        "git"
        "tree"
        "pylint"
        "black"
        "node"
        "build-essential"
    )
    sudo apt install -y "${dev_tools[@]}"

    # Instalar utilitários adicionais via APT
    echo "Instalando utilitários adicionais via APT..."
    utils=(
        "firefox"
        "vlc"
        "gimp"
        "htop"
        "curl"
    )
    sudo apt install -y "${utils[@]}"

    # Instalar fontes via APT
    echo "Instalando fontes via APT..."
    fonts=(
        "fonts-dejavu"
        "fonts-freefont-ttf"
    )
    sudo apt install -y "${fonts[@]}"

    # Após instalar fontes, importar configurações do Terminal
    echo "Importe suas configurações do terminal..."
    echo "Terminal -> Configurações -> Perfis -> Importar..."
    echo "Importe de ${HOME}/dotfiles/settings/Pro.terminal"
    echo "Pressione Enter para continuar..."
    read

    # Instalar aplicativos via Snap
    echo "Instalando Snap e aplicativos via Snap..."
    sudo apt install -y snapd
    snap_apps=(
        "spotify"
        "slack"
    )
    for app in "${snap_apps[@]}"; do
        echo "Instalando $app via Snap..."
        sudo snap install "$app"
    done

    # Instalar aplicativos via Flatpak
    echo "Instalando Flatpak e aplicativos via Flatpak..."
    sudo apt install -y flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak_apps=(
        "com.github.unactuallimit.steam"
        "com.discordapp.Discord"
    )
    for app in "${flatpak_apps[@]}"; do
        echo "Instalando $app via Flatpak..."
        flatpak install -y flathub "$app"
    done

    # Configuração do Git
    echo "Configurando Git..."
    current_name=$(git config --global --get user.name)
    if [ -z "$current_name" ]; then
        echo "Por favor, insira seu NOME COMPLETO para a configuração do Git:"
        read git_user_name
        git config --global user.name "$git_user_name"
        echo "Git user.name foi configurado para $git_user_name"
    else
        echo "Git user.name já está configurado como '$current_name'. Pulando configuração."
    fi

    current_email=$(git config --global --get user.email)
    if [ -z "$current_email" ]; then
        echo "Por favor, insira seu EMAIL para a configuração do Git:"
        read git_user_email
        git config --global user.email "$git_user_email"
        echo "Git user.email foi configurado para $git_user_email"
    else
        echo "Git user.email já está configurado como '$current_email'. Pulando configuração."
    fi

    echo "Faça login no Google Chrome. Pressione Enter para continuar..."
    read

    echo "Conecte sua Conta do Google (Configurações do Sistema -> Contas de Internet). Pressione Enter para continuar..."
    read

    echo "Faça login no Spotify. Pressione Enter para continuar..."
    read

    echo "Faça login no Discord. Pressione Enter para continuar..."
    read

    echo "Instalação de aplicativos e ferramentas concluída."
}
