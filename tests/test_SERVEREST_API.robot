*** Settings ***
Library    RequestsLibrary
Library    String

*** Variables ***
${HOST}            https://serverest.dev

# Rotas
${GET_PRODUTOS}         produtos
${GET_SINGLE_PRODUTO}   produtos/id-produto

*** Keywords ***
Pegar os produtos
    GET    url=${HOST}/${GET_PRODUTOS}

Pegar único produto
    ${GET_SINGLE_PRODUTO} = Replace String $
    GET    url=${HOST}/${GET_SINGLE_PRODUTO}

*** Test Cases ***
TC01 - Realizar busca dos produtos
    Pegar os produtos

TC02 - Realizar busca de um único produto
    Pegar único produto