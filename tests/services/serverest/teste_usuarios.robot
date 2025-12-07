*** Settings ***
Resource    base.resource


*** Test Cases ***
Validar Quantidade Dos Usuários
    Consultar Usuários    path=${PATH_USUARIOS}    status_code=200
    Should Be True    ${response['quantidade']} > 0

Validar Consulta De Um Usuário Por ID
    Consultar Usuários    path=${PATH_USUARIOS}/${ID_USUARIO}    status_code=200
    Should Be Equal As Strings    ${response['nome']}    ${NOME_USUARIO}

Validar Consulta De Usuário Por Nome
    Consultar Usuários    path=${PATH_USUARIOS}?nome=${NOME_USUARIO}    status_code=200
    Should Be Equal As Strings    ${response['usuarios'][0]['nome']}    ${NOME_USUARIO}

Validar Consulta De Usuario Por Email
    Consultar Usuários    path=${PATH_USUARIOS}?email=${EMAIL_USUARIO}    status_code=200
    Should Be Equal As Strings    ${response['usuarios'][0]['email']}    ${EMAIL_USUARIO}

Validar Consulta De Usuário Por Id Inexistente
    Consultar Usuários    path=${PATH_USUARIOS}/inexistente123    status_code=400
    Should Be Equal As Strings    ${response['id']}    ${MENSAGEM_USUARIO_INEXISTENTE}
