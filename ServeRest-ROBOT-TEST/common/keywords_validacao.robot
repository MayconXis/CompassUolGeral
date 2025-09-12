*** Settings ***
Documentation    Keywords consolidadas para automação de API
Library          RequestsLibrary
Library          Collections
Library          String
Library          DateTime
Resource         static_variables.robot
Resource         ../resources/banco_dados.resource
Resource         ../common/dynamic_keywords.robot
Resource         ../common/keywords_validacao.robot


*** Keywords ***
Cria um usuario na sessao estatico
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Set Test Variable    ${EMAIL_TESTE}    ${palavra_aleatoria}@gmail.com
    log    ${EMAIL_TESTE}

Resetar Usuario Dinamico
    [Documentation]    Reseta dados do usuário dinâmico para garantir dados únicos no próximo teste
    Set Global Variable    ${dados_usuario_dinamico}    ${None}
    Log To Console    Dados de usuário dinâmico resetados

Criar Sessão na serverest API estatico
    ${headers}    Create Dictionary
    ...           accept=application/json
    ...           Content-Type=application/json
    Create Session
    ...           alias=reqres_api
    ...           url=https://compassuol.serverest.dev
    ...           headers=${headers}

Validar Status e Mensagem
    [Arguments]    ${resposta}    ${status_esperado}    ${mensagem_esperada}
    Should Be Equal As Numbers    ${resposta.status_code}    ${status_esperado}
    ${json_resposta}=    Set Variable    ${resposta.json()}
    Should Be Equal    ${json_resposta}[message]    ${mensagem_esperada}

Validar Status GET
    [Arguments]    ${resposta}    ${status_esperado}
    Should Be Equal As Numbers    ${resposta.status_code}    ${status_esperado}

Validar Quantidade Negativa
    [Arguments]    ${resposta}    ${status_esperado}    ${campo_do_erro}    ${mensagem_esperada}
    Should Be Equal As Numbers    ${resposta.status_code}    ${status_esperado}
    ${json_resposta}=    Set Variable    ${resposta.json()}
    Should Be Equal    ${json_resposta}[quantidade]    ${mensagem_esperada}
Validar Preço Negativo
    [Arguments]    ${resposta}    ${status_esperado}    ${campo_do_erro}    ${mensagem_esperada}
    Should Be Equal As Numbers    ${resposta.status_code}    ${status_esperado}
    ${json_resposta}=    Set Variable    ${resposta.json()}
    Should Be Equal    ${json_resposta}[preco]    ${mensagem_esperada}
Criar Sessão no serverest API
    [Documentation]    Cria sessão para API ServeRest 
    Create Session    ${SESSION_NAME}    ${BASE_URL}


Gerar Payload Usuario Dinamico
    [Arguments]    ${tipo}=completo
    [Documentation]    Gera payload dinâmico para usuário
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${nome_aleatorio}=    Generate Random String    length=6    chars=[LETTERS]
    ${nome_aleatorio}=    Convert To Lower Case    ${nome_aleatorio}
    
    IF    '${tipo}' == 'completo'
        ${payload}=    Create Dictionary
        ...    name=Usuario_${nome_aleatorio}_${timestamp}
        ...    email=${nome_aleatorio}@teste.com
    ELSE IF    '${tipo}' == 'parcial'
        ${payload}=    Create Dictionary
        ...    name=Usuario_Parcial_${nome_aleatorio}
    END
    RETURN    ${payload}

Gerar Payload Login Dinamico
    ${payload}=    Create Dictionary
    ...    email=fulano@qa.com
    ...    password=teste
    RETURN    ${payload}

Criar Usuario Dinamico Completo
    [Arguments]    ${eh_admin}=${NONE}
    [Documentation]    Cria usuário dinamicamente com dados únicos e armazena para reutilização nos testes
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${nome_aleatorio}=    Generate Random String    length=8    chars=[LETTERS]
    ${nome_aleatorio}=    Convert To Lower Case    ${nome_aleatorio}
    IF    $eh_admin == $NONE
        ${eh_admin}=    Evaluate    random.choice(['true', 'false'])    modules=random
    END
    ${payload_dinamico}=    Create Dictionary
    ...    nome=Usuario_${nome_aleatorio}_${timestamp}
    ...    email=${nome_aleatorio}@qa.com
    ...    password=<senha_dinamica>
    ...    administrador=${eh_admin}
    
    
    ${resposta}=    POST On Session    ${SESSION_NAME}    /usuarios    json=${payload_dinamico}    expected_status=any
    
    ${usuario_criado}=    Create Dictionary
    ...                   payload=${payload_dinamico}
    ...                   response=${resposta}
    ...                   id=${resposta.json().get('_id', 'N/A')}
    ...                   nome=${payload_dinamico}[nome]
    ...                   email=${payload_dinamico}[email]
    ...                   administrador=${payload_dinamico}[administrador]
    
    Set Global Variable    ${dados_usuario_dinamico}    ${usuario_criado}
    RETURN    ${usuario_criado}
Gerar Payload Registro Dinamico
    [Documentation]    Gera payload dinâmico para registro
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${payload}=    Create Dictionary
    ...            email=fulano@qa.com
    ...            password=teste
    RETURN    ${payload}
Obter Usuario Dinamico Atual
    [Documentation]    Retorna dados do último usuário criado dinamicamente ou cria novo se não existir
    IF    ${dados_usuario_dinamico} == ${None}
        ${usuario}=    Criar Usuario Dinamico Completo
        RETURN    ${usuario}
    END
    RETURN    ${dados_usuario_dinamico}



Gerar Payload Atualizacao Dinamico
    [Arguments]    ${tipo}=completo
    [Documentation]    Gera payload de atualização dinâmico - tipos: completo ou parcial
    ${timestamp}=    Get Current Date    result_format=%H%M%S
    ${nome_update}=    Generate Random String    length=6    chars=[LETTERS]
    ${nome_update}=    Convert To Lower Case    ${nome_update}
    
    IF    '${tipo}' == 'completo'
        ${payload}=    Create Dictionary
        ...    nome=Updated_${nome_update}_${timestamp}
        ...    email=${nome_update}_atualizado@qa.com
        ...    password=senha_atualizada
        ...    administrador=true
    END
    RETURN    ${payload}

Criar Produto Dinamico
    [Arguments]    ${token}
    [Documentation]    Cria um produto dinamicamente e retorna seus dados, usando um token de autenticação.
    
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${nome_produto}=    Generate Random String    length=6    chars=[LETTERS]
    ${preco_aleatorio}=    Evaluate    random.randint(1, 100)    modules=random
    ${quantidade_aleatoria}=    Evaluate    random.randint(1, 100)    modules=random
    ${payload}=    Create Dictionary
    ...            nome=produto_dinamico_${nome_produto}_${timestamp}
    ...            preco=${preco_aleatorio}
    ...            descricao=descricao_dinamica_${timestamp}
    ...            quantidade=${quantidade_aleatoria}
    ${headers}=    Create Dictionary    Authorization=${token}
    ${resposta}=    POST On Session    ${SESSION_NAME}    
    ...             /produtos    
    ...             headers=${headers}    
    ...             json=${payload}    
    ...             expected_status=any
    ${produto_criado}=    Create Dictionary
    ...             response=${resposta}
    ...             data=${resposta.json()}
    ...             nome=${payload}[nome]
    RETURN    ${produto_criado}

Criar Sessão na serverest API
    Create Session    serverest_api    https://compassuol.serverest.dev

Criar e Logar Usuário Admin
    [Documentation]    Cria e faz login de um usuário admin para ser usado em outros testes.
    ${payload_novo_usuario}=    Create Dictionary
    ...    nome=AdminEstatico
    ...    email=admin.estatico@qa.com
    ...    password=teste123
    ...    administrador=true
    Criar Sessão na serverest API
    ${resposta_post}=    POST On Session    serverest_api    /usuarios    json=${payload_novo_usuario}    expected_status=any
    Should Be Equal As Numbers    ${resposta_post.status_code}    201
    ${ID_USUARIO}=    Get From Dictionary    ${resposta_post.json()}    _id
    ${NOME_USUARIO}=    Get From Dictionary    ${payload_novo_usuario}    nome
    
    ${payload_login}=    Create Dictionary
    ...    email=${payload_novo_usuario}[email]
    ...    password=${payload_novo_usuario}[password]
    ${resposta_login}=    POST On Session    serverest_api    /login    json=${payload_login}
    ${TOKEN}=    Get From Dictionary    ${resposta_login.json()}    authorization
    
    Set Test Variable    ${ID_USUARIO}
    Set Test Variable    ${NOME_USUARIO}
    Set Test Variable    ${TOKEN}
Logar Usuario Admin Existente
    [Documentation]    Faz login com usuário admin já existente
    Criar Sessão na serverest API
    ${payload_login}=    Create Dictionary
    ...    email=fulano@qa.com
    ...    password=teste
    ${resposta_login}=    POST On Session    serverest_api    /login    json=${payload_login}    expected_status=any
    IF    ${resposta_login.status_code} == 401
        ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
        ${payload_para_PUT_produto}=    Create Dictionary
        ...    nome=AdminLogin${timestamp}
        ...    email=adminlogin${timestamp}@qa.com
        ...    password=teste123
        ...    administrador=true
        ${resposta_post}=    POST On Session    serverest_api    
        ...    /usuarios    json=${payload_para_PUT_produto}
        ${payload_login}=    Create Dictionary
        ...    email=${payload_para_PUT_produto}[email]
        ...    password=${payload_para_PUT_produto}[password]
        ${resposta_login}=    POST On Session    serverest_api    
        ...                   /login    
        ...                   json=${payload_login}
    END
    ${TOKEN}=    Get From Dictionary    ${resposta_login.json()}    authorization
    Set Test Variable    ${TOKEN}






