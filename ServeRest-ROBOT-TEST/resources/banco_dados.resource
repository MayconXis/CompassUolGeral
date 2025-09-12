*** Settings ***
Library    OperatingSystem
Library    Collections
Library    JSONLibrary
Library    String
Library    DateTime

*** Variables ***
${BANCO_USUARIOS}        ${CURDIR}${/}..${/}data${/}banco_usuarios.json
${BANCO_PRODUTOS}        ${CURDIR}${/}..${/}data${/}banco_produtos.json  
${BANCO_STATUS_CODES}    ${CURDIR}${/}..${/}data${/}banco_status_codes.json

*** Keywords ***
Carregar Dados do Banco
    [Arguments]    ${arquivo_banco}
    [Documentation]    Carrega dados de um arquivo JSON
    ${conteudo}=    Get File    ${arquivo_banco}
    ${dados}=    Convert String To Json    ${conteudo}
    RETURN    ${dados}

Obter Usuario Valido
    [Arguments]    ${indice}=0
    [Documentation]    Retorna dados de um usuário válido pelo índice
    ${dados}=    Carregar Dados do Banco    ${BANCO_USUARIOS}
    ${usuario}=    Get From List    ${dados}[usuarios_validos]    ${indice}
    RETURN    ${usuario}

Obter Usuario Admin
    [Arguments]    ${indice}=0
    [Documentation]    Retorna dados de um usuário admin pelo índice
    ${dados}=    Carregar Dados do Banco    ${BANCO_USUARIOS}
    ${admin}=    Get From List    ${dados}[usuarios_admin]    ${indice}
    RETURN    ${admin}

Obter Usuario Login
    [Arguments]    ${indice}=0
    [Documentation]    Retorna dados de login pelo índice
    ${dados}=    Carregar Dados do Banco    ${BANCO_USUARIOS}
    ${login}=    Get From List    ${dados}[usuarios_login]    ${indice}
    RETURN    ${login}

Obter ID Valido
    [Arguments]    ${indice}=0
    [Documentation]    Retorna um ID válido pelo índice
    ${dados}=    Carregar Dados do Banco    ${BANCO_USUARIOS}
    ${id}=    Get From List    ${dados}[ids_validos]    ${indice}
    RETURN    ${id}

Obter ID Invalido
    [Arguments]    ${indice}=0
    [Documentation]    Retorna um ID inválido pelo índice
    ${dados}=    Carregar Dados do Banco    ${BANCO_USUARIOS}
    ${id}=    Get From List    ${dados}[ids_invalidos]    ${indice}
    RETURN    ${id}

Obter Produto Valido
    [Arguments]    ${indice}=0
    [Documentation]    Retorna dados de um produto válido pelo índice
    ${dados}=    Carregar Dados do Banco    ${BANCO_PRODUTOS}
    ${produto}=    Get From List    ${dados}[produtos_validos]    ${indice}
    RETURN    ${produto}

Obter Produto Duplicado
    [Documentation]    Retorna dados de produto duplicado
    ${dados}=    Carregar Dados do Banco    ${BANCO_PRODUTOS}
    ${produto}=    Get From Dictionary    ${dados}    produto_duplicado
    RETURN    ${produto}

Obter Status Code Esperado
    [Arguments]    ${metodo}    ${operacao}
    [Documentation]    Retorna status code esperado para método e operação
    ${dados}=    Carregar Dados do Banco    ${BANCO_STATUS_CODES}
    ${status}=    Get From Dictionary    ${dados}[status_codes_esperados][${metodo}]    ${operacao}
    RETURN    ${status}

Gerar Usuario Aleatorio
    [Documentation]    Gera dados de usuário com valores aleatórios para ServeRest
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${palavra_aleatoria}=    Generate Random String    length=6    chars=[LETTERS]
    ${palavra_aleatoria}=    Convert To Lower Case    ${palavra_aleatoria}
    ${usuario}=    Create Dictionary
    ...    nome=Usuario ${palavra_aleatoria} ${timestamp}
    ...    email=${palavra_aleatoria}${timestamp}@teste.com
    ...    password=senha123
    ...    administrador=false
    RETURN    ${usuario}

Gerar Usuario Admin Aleatorio
    [Documentation]    Gera dados de usuário admin com valores aleatórios para ServeRest
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${palavra_aleatoria}=    Generate Random String    length=6    chars=[LETTERS]
    ${palavra_aleatoria}=    Convert To Lower Case    ${palavra_aleatoria}
    ${usuario}=    Create Dictionary
    ...    nome=Admin ${palavra_aleatoria} ${timestamp}
    ...    email=admin${palavra_aleatoria}${timestamp}@qa.com
    ...    password=senha123
    ...    administrador=true
    RETURN    ${usuario}

Gerar Produto Aleatorio
    [Documentation]    Gera dados de produto com valores aleatórios para ServeRest
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${palavra_aleatoria}=    Generate Random String    length=6    chars=[LETTERS]
    ${palavra_aleatoria}=    Convert To Lower Case    ${palavra_aleatoria}
    ${preco_aleatorio}=    Evaluate    random.randint(10, 500)    modules=random
    ${quantidade_aleatoria}=    Evaluate    random.randint(1, 100)    modules=random
    ${produto}=    Create Dictionary
    ...    nome=Produto ${palavra_aleatoria} ${timestamp}
    ...    preco=${preco_aleatorio}
    ...    descricao=Descrição do produto ${palavra_aleatoria}
    ...    quantidade=${quantidade_aleatoria}
    RETURN    ${produto}

Gerar Carrinho Aleatorio
    [Arguments]    ${id_produto}
    [Documentation]    Gera dados de carrinho com produto específico
    ${quantidade_aleatoria}=    Evaluate    random.randint(1, 5)    modules=random
    ${produto_item}=    Create Dictionary    idProduto=${id_produto}    quantidade=${quantidade_aleatoria}
    ${produtos_list}=    Create List    ${produto_item}
    ${carrinho}=    Create Dictionary    produtos=${produtos_list}
    RETURN    ${carrinho}