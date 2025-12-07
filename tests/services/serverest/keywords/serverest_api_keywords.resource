*** Settings ***
Resource    ../base.resource


*** Keywords ***
Get Serverest
    [Arguments]    ${path}    ${status_code}
    Create Session    get    ${BASE_URL}
    ${response}=    GET On Session    get    ${path}    expected_status=${status_code}
    RETURN    ${response.json()}

Request Cadastro
    ${body}=    Load JSON From File    tests/services/serverest/json/cadastro.json
    ${nome}=    User Name
    ${email}=    Email
    ${password}=    Password
    
    Update Value To Json    ${body}    $..nome    ${nome}
    Update Value To Json    ${body}    $..email    ${email}
    Update Value To Json    ${body}    $..password    ${password}

    Set Suite Variable    ${body}

Post Serverest
    [Arguments]    ${path}    ${status_code}
    Create Session    post    ${BASE_URL}
    ${response}=    POST On Session    post    url=${path}    json=${body}    expected_status=${status_code}
    RETURN    ${response.json()}