#!/bin/bash

# Carregar o .bashrc se disponível
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# Adicionar outros caminhos ao PATH se necessário
# export PATH="/caminho/adicional:$PATH"