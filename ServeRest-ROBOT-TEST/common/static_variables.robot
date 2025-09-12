*** Settings ***
Documentation    Variáveis estáticas consolidadas do projeto

*** Variables ***
# URLs e Configurações Base
${BASE_URL}              https://compassuol.serverest.dev
${SESSION_NAME}          serverest

# Paths dos Bancos de Dados JSON
${BANCO_USUARIOS}        ${CURDIR}${/}..${/}data${/}banco_usuarios.json
${BANCO_ENDPOINTS}       ${CURDIR}${/}..${/}data${/}banco_endpoints.json  
${BANCO_STATUS_CODES}    ${CURDIR}${/}..${/}data${/}banco_status_codes.json

# Status Codes Comuns
${STATUS_OK}             200
${STATUS_CREATED}        201
${STATUS_NO_CONTENT}     204
${STATUS_BAD_REQUEST}    400
${STATUS_UNAUTHORIZED}   401
${STATUS_FORBIDDEN}      403
${STATUS_NOT_FOUND}      404

# Dados de Teste Padrão
${EMAIL_TESTE}           fulano@qa.com
${SENHA_PLACEHOLDER}     teste
# Headers Padrão
&{HEADERS_JSON}          Content-Type=application/json
&{HEADERS_FORM}          Content-Type=application/x-www-form-urlencoded