*** Settings ***
Library    RequestsLibrary
Library    String

*** Variables ***
${HOST}    https://serverest.dev

# Rotas
${LOGIN}    login
${USUARIOS}    usuarios
${PRODUTOS}    produtos
${CARRINHOS}    carrinhos

*** Keywords ***
Criar Sessão
    Create Session    alias=serverest    url=${HOST}

Deletar Sessões
    Delete All Sessions

Criar Header
    ${header}    Create Dictionary    Content-Type=application/json

Fazer Login
    ${header}=    Criar Header
    ${body}    Create Dictionary    email=fulano@qa.com    password=teste
    ${response}    POST On Session    alias=serverest    url=${LOGIN}    headers=${header}    data=${body}
    Log To Console    ${response.json()['authorization']}
    RETURN    ${response.json()['authorization']}

# Usuários  
Cadastrar usuário e deletar
    ${authorization}    Fazer Login
    ${login_header}    Create Dictionary    Content-Type=application/json    authorization=${authorization}
    ${body}    Create Dictionary    nome=Fulano da Silva    email=beltrano@sasinhas.sscom.br    password=teste    administrador=true
    ${response}    POST On Session    alias=serverest    url=${USUARIOS}    headers=${login_header}    json=${body}
    Log To Console    ${response.json()['message']}
    
    ${id}=    Set Variable    ${response.json()['_id']}
    ${response}    Delete On Session    alias=serverest    url=${PRODUTOS}/${id}    headers=${login_header}
    Log To Console    ${response.json()['message']}

# Produtos
Cadastrar produto e deletar
    ${authorization}    Fazer Login
    ${login_header}    Create Dictionary    Content-Type=application/json    authorization=${authorization}
    ${body}    Create Dictionary    nome=Thinkpad t491    preco=1200    descricao=notebook    quantidade=1000
    ${response}    POST On Session    alias=serverest    url=${PRODUTOS}    headers=${login_header}    json=${body}
    Log To Console    ${response.json()['message']}
    
    ${id}=    Set Variable    ${response.json()['_id']}
    ${response}    Delete On Session    alias=serverest    url=${PRODUTOS}/${id}    headers=${login_header}
    Log To Console    ${response.json()['message']}

*** Test Cases ***
TC01 - Testar cadastrar usuário e produto

    Criar Sessão

    Cadastrar usuário e deletar
    Cadastrar produto e deletar

    Deletar Sessões