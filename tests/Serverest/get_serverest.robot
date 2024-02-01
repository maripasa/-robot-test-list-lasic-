*** Settings ***
Library    RequestsLibrary
Library    String

*** Variables ***
${HOST}    https://serverest.dev

# Rotas
${USUARIOS}    usuarios
${PRODUTOS}    produtos
${CARRINHOS}    carrinhos

*** Keywords ***
# Gerenciamento de Sessão HTML
Criar Sessão
    Create Session    alias=serverest    url=${HOST}

Deletar Sessões
    Delete All Sessions

# Usuários  
Pegar os usuários
    GET On Session    alias=serverest    url=${USUARIOS}

Pegar único usuário por id ${id}
    GET On Session    alias=serverest    url=${USUARIOS}/${id}

# Produtos
Pegar os produtos
    GET On Session    alias=serverest    url=${PRODUTOS}

Pegar único produto por id ${id}
    GET On Session    alias=serverest    url=${PRODUTOS}/${id}

# Carrinhos
Pegar os carrinhos
    GET On Session    alias=serverest    url=${CARRINHOS}

Pegar único carrinho por id ${id}
    GET On Session    alias=serverest    url=${CARRINHOS}/${id}

*** Test Cases ***
TC01 - Realizar requisições GET

    Criar Sessão

    Pegar os usuários
    Pegar único usuário por id 0E3ri5ZKLlPQ52g1

    Pegar os produtos
    Pegar único produto por id BeeJh5lz3k6kSIzA

    Pegar os carrinhos
    Pegar único carrinho por id qbMqntef4iTOwWfg

    Deletar Sessões
