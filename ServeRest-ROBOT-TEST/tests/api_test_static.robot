*** Settings ***
Documentation    Testes de API estáticos para Serverest - Cobertura completa com dados fixos
Library          RequestsLibrary
Library          String
Library          Collections
Resource         ../common/keywords_statics.robot
Resource         ../common/keywords_validacao.robot

*** Test Cases ***
Cenário 01: POST Cadastrar usuário comum estático
    [Tags]    POST    USUARIOS    ESTATICO
    POST Endpoint /usuarios estatico

Cenário 02: POST Cadastrar usuário admin estático
    [Tags]    POST    USUARIOS    ESTATICO
    POST Endpoint /usuarios admin estatico

Cenário 03: POST Cadastrar usuário com email existente estático
    [Tags]    POST    USUARIOS    NEGATIVO    ESTATICO
    POST Endpoint /usuarios duplicado estatico

Cenário 04: POST Login com credenciais válidas estático
    [Tags]    POST    LOGIN    ESTATICO
    POST Endpoint /login estatico

Cenário 05: POST Login com credenciais inválidas estático
    [Tags]    POST    LOGIN    NEGATIVO    ESTATICO
    POST Endpoint /login credenciais invalidas estatico

Cenário 06: POST Múltiplos logins incorretos estático
    [Tags]    POST    LOGIN    NEGATIVO    ESTATICO
    POST Endpoint /login multiplos incorretos estatico

Cenário 07: POST Criar produto com dados estáticos
    [Tags]    POST    PRODUTOS    ESTATICO
    POST Endpoint /produtos estatico

Cenário 08: POST Criar produto duplicado estático
    [Tags]    POST    PRODUTOS    NEGATIVO    ESTATICO
    POST Endpoint /produtos duplicado estatico

Cenário 09: POST Criar produto com preço negativo estático
    [Tags]    POST    PRODUTOS    NEGATIVO    ESTATICO
    POST Endpoint /produtos preco negativo estatico

Cenário 10: POST Criar produto com quantidade negativa estático
    [Tags]    POST    PRODUTOS    NEGATIVO    ESTATICO
    POST Endpoint /produtos quantidade negativa estatico

Cenário 11: POST Criar produto sem token estático
    [Tags]    POST    PRODUTOS    NEGATIVO    ESTATICO
    POST Endpoint /produtos sem token estatico

Cenário 12: POST Criar carrinho com dados estáticos
    [Tags]    POST    CARRINHOS    ESTATICO
    POST Endpoint /carrinhos estatico

Cenário 13: GET Listar usuários estático
    [Tags]    GET    USUARIOS    ESTATICO
    GET Endpoint /usuarios estatico

Cenário 14: GET Obter usuário por ID válido estático
    [Tags]    GET    USUARIOS    ESTATICO
    GET Endpoint /usuarios/id valido estatico

Cenário 15: GET Obter usuário por ID inválido estático
    [Tags]    GET    USUARIOS    NEGATIVO    ESTATICO
    GET Endpoint /usuarios/id invalido estatico

Cenário 16: GET Listar produtos estático
    [Tags]    GET    PRODUTOS    ESTATICO
    GET Endpoint /produtos estatico

Cenário 17: GET Obter produto por ID válido estático
    [Tags]    GET    PRODUTOS    ESTATICO
    GET Endpoint /produtos/id valido estatico

Cenário 18: GET Obter produto por ID inválido estático
    [Tags]    GET    PRODUTOS    INVALIDO    ESTATICO
    GET Endpoint /produtos/id invalido estatico

Cenário 19: GET Listar carrinhos estático
    [Tags]    GET    CARRINHOS    ESTATICO
    GET Endpoint /carrinhos estatico

Cenário 21: GET Produto com ID não encontrado estático
    [Tags]    GET    PRODUTOS    NEGATIVO    ESTATICO
    GET Endpoint /produtos com ID nao encontrado

Cenário 22: PUT Atualizar usuário estático
    [Tags]    PUT    USUARIOS    ESTATICO
    PUT Endpoint /usuarios estatico

Cenário 23: PUT Atualizar produto estático
    [Tags]    PUT    PRODUTOS    ESTATICO
    PUT Endpoint /produtos estatico
Cenário 24: PUT Atualizar produto sem alterar dados estático
    [Tags]    PUT    PRODUTOS    ESTATICO
    PUT Endpoint /produtos sem alteracao estatico

Cenário 25: PUT Atualizar produto com preco negativo estatico
    [Tags]    PUT    PRODUTOS    NEGATIVO    ESTATICO
    PUT Endpoint /produtos preco negativo estatico

Cenário 26: PUT Atualizar produto com quantidade negativa estatico
    [Tags]    PUT    PRODUTOS    NEGATIVO    ESTATICO
    PUT Endpoint /produtos quantidade negativa estatico

Cenário 27: PUT Atualizar produto sem token estatico
    [Tags]    PUT    PRODUTOS    NEGATIVO    ESTATICO
    PUT Endpoint /produtos sem token estatico

Cenário 28: PUT Atualizar usuario com email duplicado estatico
    [Tags]    PUT    USUARIOS    NEGATIVO    ESTATICO
    PUT Endpoint /usuarios email duplicado estatico

Cenário 29: PUT Atualizar produto com nome duplicado estatico
    [Tags]    PUT    PRODUTOS    NEGATIVO    ESTATICO
    PUT Endpoint /produtos nome duplicado estatico

Cenário 30: DELETE Excluir produto estático
    [Tags]    DELETE    PRODUTOS    ESTATICO
    DELETE Endpoint /produtos estatico

Cenário 31: DELETE Cancelar compra do carrinho estático
    [Tags]    DELETE    CARRINHOS    ESTATICO
    DELETE Endpoint /carrinhos/cancelar-compra estatico

Cenário 32: DELETE Concluir compra do carrinho estático
    [Tags]    DELETE    CARRINHOS    ESTATICO
    DELETE Endpoint /carrinhos/concluir-compra estatico
Cenário 33: DELETE Excluir usuario estatico
    [Tags]    DELETE    USUARIOS    ESTATICO
    DELETE Endpoint /usuarios estatico

Cenário 34: DELETE Excluir produto com ID de usuário estático
    [Tags]    DELETE    PRODUTOS    NEGATIVO    ESTATICO
    DELETE Endpoint /produtos com ID de usuario
