*** Settings ***
Documentation    Testes de API com dados dinâmicos 
Resource         ../common/base.robot
Resource         ../common/keywords_validacao.robot
Resource         ../common/dynamic_keywords.robot
Resource         ../resources/banco_dados.resource
Suite Setup      Inicializar Sessao Global
Suite Teardown   Finalizar Sessao Global
Test Setup       Resetar Usuario Dinamico

*** Test Cases ***
Cenário 35: POST Cadastrar usuário dinâmico na serverest
    [Tags]    POST    DINAMICO
    POST Endpoint /usuarios dinamico

Cenário 36: POST Login usuário dinâmico
    [Tags]    POST    DINAMICO
    POST Endpoint /login dinamico

Cenário 37: POST Criar produto com token de administrador
    [Tags]    POST    DINAMICO
    POST Endpoint /produtos dinamico

Cenário 38: POST Adicionar e Criar carrinho completo dinâmico
    [Tags]    POST    DINAMICO
    POST Endpoint /carrinhos completo

Cenário 39: POST Registro com email existente dinâmico
    [Tags]    POST    DINAMICO
    POST Endpoint /usuarios duplicado

Cenário 40: POST Múltiplos logins com senha incorreta dinâmico
    [Tags]    POST    DINAMICO
    POST Endpoint /login multiplos incorretos

Cenário 41: POST Login com credenciais inválidas dinâmico
    [Tags]    POST    DINAMICO
    POST Endpoint /login credenciais invalidas

Cenário 42: POST Registro com nome de produto duplicado dinâmico
    [Tags]    POST    DINAMICO
    POST Endpoint /produtos duplicado

Cenário 43: POST Registro com preço negativos dinâmico
    [Tags]    POST    DINAMICO
    POST Endpoint /produtos preco negativo

Cenário 44: POST Registro com quantidade negativa dinâmico
    [Tags]    POST    DINAMICO
    POST Endpoint /produtos quantidade negativa

Cenário 45: POST Acesso a rota protegida sem token dinâmico
    [Tags]    POST    DINAMICO
    POST Endpoint /produtos sem token

Cenário 46: GET Listar usuários dinâmico
    [Tags]    GET    DINAMICO
    GET Endpoint /usuarios dinamico

Cenário 47: GET Obter usuário por ID válido dinâmico
    [Tags]    GET    DINAMICO
    GET Endpoint /usuarios/id valido dinamico

Cenário 48: GET Obter usuário por ID inválido dinâmico
    [Tags]    GET    DINAMICO
    GET Endpoint /usuarios/id invalido dinamico

Cenário 49: PUT Atualizar produto com preco negativo dinamico
    [Tags]    PUT    DINAMICO
    PUT Endpoint /produtos preco negativo dinamico

Cenário 50: PUT Atualizar produto com quantidade negativa dinamico
    [Tags]    PUT    DINAMICO
    PUT Endpoint /produtos quantidade negativa dinamico

Cenário 51: PUT Atualizar produto sem token dinamico
    [Tags]    PUT    DINAMICO
    PUT Endpoint /produtos sem token dinamico

Cenário 52: PUT Atualizar usuario com email duplicado dinamico
    [Tags]    PUT    DINAMICO
    PUT Endpoint /usuarios email duplicado dinamico

Cenário 53: PUT Atualizar produto com nome duplicado dinamico
    [Tags]    PUT    DINAMICO
    PUT Endpoint /produtos nome duplicado dinamico

Cenário 54: DELETE Excluir usuário dinâmico
    [Tags]    DELETE    DINAMICO
    DELETE Endpoint /usuarios dinamico

Cenário 55: DELETE Excluir produto dinâmico
    [Tags]    DELETE    DINAMICO
    DELETE Endpoint /produtos dinamico

Cenário 56: DELETE Concluir compra do carrinho dinâmico
    [Tags]    DELETE    DINAMICO
    DELETE Endpoint /carrinhos/concluir-compra dinamico

Cenário 57: DELETE Cancelar compra do carrinho dinâmico
    [Tags]    DELETE    DINAMICO
    DELETE Endpoint /carrinhos/cancelar-compra dinamico


