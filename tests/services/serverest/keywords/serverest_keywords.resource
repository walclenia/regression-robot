*** Settings ***
Resource    ../base.resource


*** Keywords ***
Consultar Usuários
    [Arguments]    ${path}    ${status_code}
    ${response}=    Get Serverest    ${path}    ${status_code}
    Set Suite Variable    ${response}

Cadastro de Usuário
    [Arguments]    ${path}    ${status_code} 
    Request Cadastro
    ${response}=    Post Serverest    ${path}    ${status_code}
    Set Suite Variable    ${response}
    

Cadastro de Usuário Sem Campo Obrigatório
    [Arguments]    ${path}    ${status_code}    ${chave}
    Request Cadastro
    Delete Object From Json    ${body}    $..${chave}
    ${response}=    Post Serverest    ${path}    ${status_code}
    Set Suite Variable    ${response}
