*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}                   https://docs.google.com/forms/d/e/1FAIpQLSeZEahLGWaM9d6XcVwbvNoIRiZJEikZi-St_6KFevakJhPFHQ/viewform

# Credenciais
${email_permitido}            <email_permitido>
${senha_permitida}            <senha_email_permitido>

# Elementos da Página de Login
${input_email}                id:identifierId
${input_senha}                //input[@type='password']
${button_email}               id:identifierNext
${button_senha}               id:passwordNext

# Elementos da Página do Formulário
${checkbox_registrar_email}   id:i5
${dropdown_select_nome}       //span[@class='vRMGwf oJeWuf']
${select_nome}                //span[@class='vRMGwf oJeWuf']
${multiple_choice_horario}    id:i16
${multiple_choice_area}       id:i38
${multiple_choice_projeto}    id:i64
${textarea_atividade}         //textarea[@class='KHxj8b tL9Q4c']
${texto_textarea_atividade}   Exemplo:\nGEP: Instalação do backend\nCES: Conclusão da Issue AAA-123\nEstudo: Curso Java - 15/39 aulas

*** Keywords ***
Abrir Navegador e Formulário Google
    Open Browser    ${BASE_URL}    chrome

Clicar Elemento e Esperar
    [Arguments]    ${locator}
    Wait Until Element Is Visible   ${locator}    20s
    Click Element    ${locator}

Fazer Login
    [Arguments]    ${username}    ${password}
    Clicar Elemento e Esperar    ${input_email}
    Input Text    ${input_email}    ${username}
    Clicar Elemento e Esperar    ${button_email}
    Wait Until Element Is Visible    ${input_senha}    10s
    Input Text    ${input_senha}    ${password}
    Clicar Elemento e Esperar    ${button_senha}

Preencher Formulário
    Clicar Elemento e Esperar    ${checkbox_registrar_email}
    Clicar Elemento e Esperar    ${dropdown_select_nome}
    Clicar Elemento e Esperar    ${select_nome}
    Clicar Elemento e Esperar    ${multiple_choice_horario}
    Clicar Elemento e Esperar    ${multiple_choice_area}
    Clicar Elemento e Esperar    ${multiple_choice_projeto}
    Input Text                   ${textarea_atividade}    ${texto_textarea_atividade}

Fechar Navegador
    Close Browser

*** Test Cases ***
TC01: Abrir formulário, com email permitido, e preencher campos
    Abrir Navegador e Formulário Google
    Fazer Login    ${email_permitido}    ${senha_permitida}
    Preencher Formulário