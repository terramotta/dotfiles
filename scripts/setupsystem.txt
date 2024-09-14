#!/bin/bash

# Pode ser incrementado com outras funcionalidades de sistema, como firewall (ufw), configurações de rede, configurações do gnome (gsettings), etc

# Função para configuração básica do sistema
function basic_system_setup {
    echo "Configurando opções básicas do sistema..."

    # Configurar o fuso horário
    echo "Configurando o fuso horário para America/Sao_Paulo..."
    sudo timedatectl set-timezone America/Sao_Paulo

    # Alterar o Tema do Sistema
    echo "Configurando o Tema do Sistema..."
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

    echo "Configuração básica do sistema concluída."
}