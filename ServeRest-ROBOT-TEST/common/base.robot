*** Settings ***
Documentation    Arquivo base com configurações globais e sessão universal
Library          RequestsLibrary
Library          Collections
Library          String
Library          DateTime
Resource         ../common/keywords_statics.robot
Resource         ../common/keywords_validacao.robot
Resource         ../common/dynamic_keywords.robot
Resource         ../resources/banco_dados.resource
Test Setup       Inicializar Sessao Global
Suite Teardown   Finalizar Sessao Global

*** Variables ***
${BASE_URL}      https://compassuol.serverest.dev
${SESSION_NAME}  serverest

*** Keywords ***
Inicializar Sessao Global
    [Documentation]    Cria sessão global para todos os testes
    Create Session    ${SESSION_NAME}    ${BASE_URL}
    Log To Console    Sessão global inicializada com sucesso

Finalizar Sessao Global
    [Documentation]    Finaliza sessão global
    Delete All Sessions
    Log To Console    Sessão global finalizada

