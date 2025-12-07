*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     FakerLibrary
Resource    keywords/serverest_api_keywords.resource
Resource    keywords/serverest_keywords.resource


*** Variables ***
${BASE_URL}                         https://serverest.dev
${PATH_USUARIOS}                    /usuarios
${PATH_PRODUTOS}                    /produtos
${ID_USUARIO}                       34pA05mdEBkiMXw5
${EMAIL_USUARIO}                    sung.dare@gmail.com
${NOME_USUARIO}                     Alec Schulist PhD

${MENSAGEM_USUARIO_INEXISTENTE}     id deve ter exatamente 16 caracteres alfanuméricos
${MESSAGEM_CADASTRO_REALIZADO}      Cadastro realizado com sucesso
