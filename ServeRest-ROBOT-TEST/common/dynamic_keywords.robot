*** Settings ***
Documentation    criação dinâmica com dados únicos
Library          RequestsLibrary
Library          Collections
Library          String
Library          DateTime
Resource         static_variables.robot
Resource         ../common/keywords_validacao.robot

*** Variables ***
${dados_usuario_dinamico}    ${None}
${produtos}    ${None}
${eh_admin}=    Set Variable    ${True}


*** Keywords ***
POST Endpoint /usuarios dinamico
    ${usuario_dinamico}=    Criar Usuario Dinamico Completo
    Validar Status e Mensagem    ${usuario_dinamico}[response]    201    Cadastro realizado com sucesso
POST Endpoint /login dinamico
    ${payload}=    Gerar Payload Login Dinamico
    ${resposta}=    POST On Session    ${SESSION_NAME}    
    ...             /login    
    ...             json=${payload}    
    ...             expected_status=any
    Log To Console    Login dinâmico testado para: ${payload}[email]
    Validar Status e Mensagem    ${resposta}    200    Login realizado com sucesso

POST Endpoint /produtos dinamico
    ${usuario}=    Criar Usuario Dinamico Completo    eh_admin=true
    ${payload_login}=    Create Dictionary
    ...    email=${usuario}[email]
    ...    password=<senha_dinamica>
    ${resp_login}=    POST On Session    ${SESSION_NAME}    
    ...                /login    
    ...                json=${payload_login}    
    ...                expected_status=200
    ${token}=    Set Variable    ${resp_login.json()}[authorization]
    ${produto_criado}=    Criar Produto Dinamico    ${token}
    Log To Console    Produto criado dinamicamente com sucesso
    Validar Status e Mensagem    ${produto_criado}[response]    201    Cadastro realizado com sucesso

POST Endpoint /carrinhos completo
    ${usuario}=    Criar Usuario Dinamico Completo    eh_admin=true
    ${payload_login}=    Create Dictionary
    ...    email=${usuario}[email]
    ...    password=<senha_dinamica>
    ${resp_login}=    POST On Session    ${SESSION_NAME}    /login    json=${payload_login}    expected_status=any
    Log To Console    Login status: ${resp_login.status_code}
    ${token}=    Set Variable    ${resp_login.json()}[authorization]
    ${produto_criado}=    Criar Produto Dinamico    ${token}
    ${id_produto}=    Set Variable    ${produto_criado}[data][_id]
    ${produto_item}=    Create Dictionary    
    ...                    idProduto=${id_produto}    
    ...                    quantidade=${1}
    ${produtos_list}=    Create List    ${produto_item}
    ${payload}=    Create Dictionary    
    ...            produtos=${produtos_list}
    ${headers}=    Create Dictionary    Authorization=${token}
    ${resposta_carrinho}=    POST On Session    ${SESSION_NAME}    
    ...                    /carrinhos    
    ...                    json=${payload}    
    ...                    headers=${headers}    
    ...                    expected_status=201
    Log To Console    Carrinho criado com sucesso
    Validar Status e Mensagem    ${resposta_carrinho}    201    Cadastro realizado com sucesso

POST Endpoint /usuarios duplicado
    ${usuario1}=    Criar Usuario Dinamico Completo
    ${payload_duplicado}=    Create Dictionary
    ...    nome=Usuario_Duplicado
    ...    email=${usuario1}[email]
    ...    password=<senha_dinamica>
    ...    administrador=false
    ${resposta}=    POST On Session    ${SESSION_NAME}    /usuarios    json=${payload_duplicado}    expected_status=any
    Validar Status e Mensagem    ${resposta}    400    Este email já está sendo usado
    Log To Console    Email duplicado testado dinâmico
    Validar Status e Mensagem    ${resposta}    400    Este email já está sendo usado
POST Endpoint /login multiplos incorretos
    ${usuario}=    Criar Usuario Dinamico Completo
    FOR    ${i}    IN RANGE    5
        ${payload_login}=    Create Dictionary
        ...    email=${usuario}[email]
        ...    password=senha_incorreta
        ${resposta}=    POST On Session    ${SESSION_NAME}    /login    json=${payload_login}    expected_status=any
       Validar Status e Mensagem    ${resposta}    401    Email e/ou senha inválidos
        Log To Console    Executado Múltiplos logins com senha incorreta dinâmico
    END

POST Endpoint /login credenciais invalidas
    ${email_invalido}=    Generate Random String    length=8    chars=[LETTERS]
    ${payload_login}=    Create Dictionary
    ...    email=${email_invalido}@inexistente.com
    ...    password=senha_inexistente
    ${resposta}=    POST On Session    ${SESSION_NAME}    /login    json=${payload_login}    expected_status=401
    Validar Status e Mensagem    ${resposta}    401    Email e/ou senha inválidos
    Log To Console    Executado login com Credenciais inválidas dinamicamente

POST Endpoint /produtos duplicado
    ${usuario}=    Criar Usuario Dinamico Completo    eh_admin=true
    ${payload_login}=    Create Dictionary
    ...    email=${usuario}[email]
    ...    password=<senha_dinamica>
    ${resp_login}=    POST On Session    ${SESSION_NAME}    /login    json=${payload_login}    expected_status=any
    Log To Console    Login status: ${resp_login.status_code}
    ${token}=    Set Variable    ${resp_login.json()}[authorization]
    ${produto_criado}=    Criar Produto Dinamico    ${token}
    ${payload_duplicado}=    Create Dictionary
    ...    nome=${produto_criado}[nome]
    ...    preco=250
    ...    descricao=Produto duplicado
    ...    quantidade=10
    ${headers}=    Create Dictionary    Authorization=${token}
    ${resposta}=    POST On Session    ${SESSION_NAME}   
    ...            /produtos    
    ...            json=${payload_duplicado}    
    ...            headers=${headers}    
    ...            expected_status=any
    Validar Status e Mensagem    ${resposta}    400    Já existe produto com esse nome
    Log To Console    Produto duplicado testado dinamicamente

POST Endpoint /produtos preco negativo
    ${usuario}=    Criar Usuario Dinamico Completo    eh_admin=true
    ${payload_login}=    Create Dictionary
    ...    email=${usuario}[email]
    ...    password=<senha_dinamica>
    ${resp_login}=    POST On Session    ${SESSION_NAME}    /login    json=${payload_login}    expected_status=any
    Log To Console    Login status: ${resp_login.status_code}
    ${token}=    Set Variable    ${resp_login.json()}[authorization]
    ${nome_produto}=    Generate Random String    length=6    chars=[LETTERS]
    ${payload_preco_negativo}=    Create Dictionary
    ...    nome=Produto_${nome_produto}
    ...    preco=-10
    ...    descricao=Produto com preço negativo
    ...    quantidade=50
    ${headers}=    Create Dictionary    Authorization=${token}
    ${resposta}=    POST On Session    ${SESSION_NAME}    
    ...             /produtos    
    ...              json=${payload_preco_negativo}    
    ...               headers=${headers}    
    ...               expected_status=any
    Validar Preço Negativo    ${resposta}    400   preco    preco deve ser um número positivo
    Log To Console    Preço negativo testado dinamicamente
POST Endpoint /produtos quantidade negativa
    ${usuario}=    Criar Usuario Dinamico Completo    eh_admin=true
    ${payload_login}=    Create Dictionary
    ...    email=${usuario}[email]
    ...    password=<senha_dinamica>
    ${resp_login}=    POST On Session    ${SESSION_NAME}    /login    json=${payload_login}    expected_status=any
    Log To Console    Login status: ${resp_login.status_code}
    ${token}=    Set Variable    ${resp_login.json()}[authorization]
    ${nome_produto}=    Generate Random String    length=6    chars=[LETTERS]
    ${payload_quantidade_negativo}=    Create Dictionary
    ...                nome=Produto_${nome_produto}
    ...                preco=10
    ...                descricao=Produto com quantidade negativa
    ...                quantidade=-50
    ${headers}=    Create Dictionary    Authorization=${token}
    ${resposta}=    POST On Session    ${SESSION_NAME}    
    ...                /produtos    
    ...                json=${payload_quantidade_negativo}    
    ...                headers=${headers}    
    ...                expected_status=any
    Validar Quantidade Negativa    ${resposta}    400    quantidade    quantidade deve ser maior ou igual a 0
    Log To Console    Quantidade negativa testado dinamicamente
POST Endpoint /produtos sem token
    ${payload_produto}=    Create Dictionary
    ...    nome=Teste
    ...    preco=100
    ...    descricao=Teste
    ...    quantidade=1
    ${resposta_post}=    POST On Session    ${SESSION_NAME}    /produtos    json=${payload_produto}    expected_status=any
    Should Be Equal As Numbers    ${resposta_post.status_code}    401
    Log To Console    Acesso sem token testado dinamicamente

GET Endpoint /usuarios dinamico
    [Documentation]    Testa a listagem de usuários dinamicamente
    Criar Sessão na serverest API
    ${resposta}=    GET On Session    ${SESSION_NAME}    /usuarios
    Validar Status GET    ${resposta}    200
    Should Contain    ${resposta.json()}    usuarios
    Log To Console    Lista de usuários obtida com sucesso dinamicamente

GET Endpoint /usuarios/id valido dinamico
    [Documentation]    Testa a busca de usuário por ID válido dinamicamente
    ${usuario_criado}=    Criar Usuario Dinamico Completo
    ${id_usuario}=    Set Variable    ${usuario_criado}[id]
    ${resposta}=    GET On Session    ${SESSION_NAME}    /usuarios/${id_usuario}
    Validar Status GET    ${resposta}    200
    Should Be Equal    ${resposta.json()}[_id]    ${id_usuario}
    Log To Console    Usuário por ID válido obtido com sucesso dinamicamente

GET Endpoint /usuarios/id invalido dinamico
    [Documentation]    Testa a busca de usuário por ID inválido dinamicamente
    Criar Sessão na serverest API
    ${resposta}=    GET On Session    ${SESSION_NAME}    
    ...            /usuarios/999999999999999999999999    
    ...            expected_status=any
    Should Be Equal As Numbers    ${resposta.status_code}    400
    Should Be Equal    ${resposta.json()}[id]    id deve ter exatamente 16 caracteres alfanuméricos
    Log To Console    Teste de ID de usuário inválido dinâmico executado

PUT Endpoint /produtos preco negativo dinamico
    [Documentation]    Atualiza um produto com preco negativo
    ${usuario_admin}=    Criar Usuario Dinamico Completo    eh_admin=true
    ${payload_login}=    Create Dictionary
    ...    email=${usuario_admin}[email]
    ...    password=<senha_dinamica>
    ${resp_login}=    POST On Session    ${SESSION_NAME}    
    ...               /login    
    ...                json=${payload_login}    
    ...                expected_status=any
    ${token}=    Set Variable    ${resp_login.json()}[authorization]
    ${produto}=    Criar Produto Dinamico    ${token}
    ${id_produto}=    Set Variable    ${produto}[data][_id]
    ${payload_atualizado}=    Create Dictionary    
    ...                    nome=${produto}[nome]    
    ...                    preco=-10    
    ...                    descricao=preco negativo dinamicamente    
    ...                    quantidade=1
    ${headers}=    Create Dictionary    Authorization=${token}
    ${resposta}=    PUT On Session    ${SESSION_NAME}    
    ...                  /produtos/${id_produto}    
    ...                  json=${payload_atualizado}    
    ...                  headers=${headers}    
    ...                  expected_status=any
    Should Be Equal As Numbers    ${resposta.status_code}    400
    Should Contain    ${resposta.json()}[preco]    preco deve ser um número positivo
    Log To Console    Teste de atualização de produto com preco negativo dinâmico executado

PUT Endpoint /produtos quantidade negativa dinamico
    [Documentation]    Atualiza um produto com quantidade negativa
    ${usuario_admin}=    Criar Usuario Dinamico Completo    eh_admin=true
    ${payload_login}=    Create Dictionary
    ...    email=${usuario_admin}[email]
    ...    password=<senha_dinamica>
    ${resp_login}=    POST On Session    ${SESSION_NAME}    
    ...                /login    
    ...                json=${payload_login}    
    ...                expected_status=any
    ${token}=    Set Variable    ${resp_login.json()}[authorization]
    ${produto}=    Criar Produto Dinamico    ${token}
    ${id_produto}=    Set Variable    ${produto}[data][_id]
    ${payload_atualizado}=    Create Dictionary    
    ...                        nome=${produto}[nome]   
    ...                        preco=10    
    ...                        descricao=quantidade negativa dinamicamente    
    ...                        quantidade=-5
    ${headers}=    Create Dictionary    Authorization=${token}
    ${resposta}=    PUT On Session    ${SESSION_NAME}    
    ...                        /produtos/${id_produto}    
    ...                        json=${payload_atualizado}    
    ...                        headers=${headers}    
    ...                        expected_status=any
    Should Be Equal As Numbers    ${resposta.status_code}    400
    Should Contain    ${resposta.json()}[quantidade]    quantidade deve ser maior ou igual a 0
    Log To Console    Teste de atualização de produto com quantidade negativa dinâmico executado

PUT Endpoint /produtos sem token dinamico
    [Documentation]    Atualiza um produto sem token
    ${usuario_admin}=    Criar Usuario Dinamico Completo    eh_admin=true
    ${payload_login}=    Create Dictionary
    ...    email=${usuario_admin}[email]
    ...    password=<senha_dinamica>
    ${resp_login}=    POST On Session    ${SESSION_NAME}    
    ...                /login    
    ...                json=${payload_login}    
    ...                 expected_status=any
    ${token}=    Set Variable    ${resp_login.json()}[authorization]
    ${produto}=    Criar Produto Dinamico    ${token}
    ${id_produto}=    Set Variable    ${produto}[data][_id]
    ${payload_atualizado}=    Create Dictionary    
    ...                    nome=${produto}[nome]    
    ...                    preco=10   
    ...                    descricao=sem token dinamicamente    
    ...                    quantidade=5
    ${resposta}=    PUT On Session    ${SESSION_NAME}    
    ...                    /produtos/${id_produto}    
    ...                    json=${payload_atualizado}    
    ...                    expected_status=any
    Validar Status e Mensagem    ${resposta}    401    Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
    Log To Console    Teste de atualização de produto sem token dinâmico executado

PUT Endpoint /usuarios email duplicado dinamico
    [Documentation]    Atualiza usuario com email duplicado
    ${usuario_1}=    Criar Usuario Dinamico Completo
    ${usuario_2}=    Criar Usuario Dinamico Completo
    ${id_usuario_para_atualizar}=    Set Variable    ${usuario_1}[id]
    ${email_duplicado}=    Set Variable    ${usuario_2}[email]
    ${payload_atualizado}=    Create Dictionary    
    ...                        nome=Usuario Atualizado com Email Duplicado       
    ...                        email=${email_duplicado}    
    ...                        password=senha_nova    
    ...                        administrador=false
    ${resposta}=    PUT On Session    ${SESSION_NAME}    
    ...                        /usuarios/${id_usuario_para_atualizar}    
    ...                        json=${payload_atualizado}    
    ...                        expected_status=any
    Validar Status e Mensagem    ${resposta}    400    Este email já está sendo usado
    Log To Console    Teste de atualização de usuário com email duplicado dinâmico executado

PUT Endpoint /produtos nome duplicado dinamico
    [Documentation]    Atualiza produto com nome duplicado
    ${usuario_admin}=    Criar Usuario Dinamico Completo    eh_admin=true
    ${payload_login}=    Create Dictionary
    ...    email=${usuario_admin}[email]
    ...    password=<senha_dinamica>
    ${resp_login}=    POST On Session    ${SESSION_NAME}    
    ...              /login    
    ...               json=${payload_login}    
    ...               expected_status=any
    ${token}=    Set Variable    ${resp_login.json()}[authorization]
    ${produto_1}=    Criar Produto Dinamico    ${token}
    ${produto_2}=    Criar Produto Dinamico    ${token}
    ${id_produto_para_atualizar}=    Set Variable    ${produto_2}[data][_id]
    ${nome_duplicado}=    Set Variable    ${produto_1}[nome]
    ${payload_atualizado}=    Create Dictionary    
    ...                  nome=${nome_duplicado}    
    ...                  preco=100    
    ...                  descricao=nome duplicado dinamicamente    
    ...                  quantidade=10
    ${headers}=    Create Dictionary    Authorization=${token}
    ${resposta}=    PUT On Session    ${SESSION_NAME}    
    ...                   /produtos/${id_produto_para_atualizar}    
    ...                    json=${payload_atualizado}    
    ...                    headers=${headers}    
    ...                    expected_status=any
    Validar Status e Mensagem    ${resposta}    400    Já existe produto com esse nome
    Log To Console    Teste de atualização de produto com nome duplicado dinâmico executado

DELETE Endpoint /usuarios dinamico
    [Documentation]    Testa a exclusão de um usuário dinamicamente
    ${usuario_criado}=    Criar Usuario Dinamico Completo
    ${id_usuario}=    Set Variable    ${usuario_criado}[id]
    ${admin_user}=    Criar Usuario Dinamico Completo    eh_admin=true
    ${payload_login}=    Create Dictionary
    ...                email=${admin_user}[email]
    ...                password=<senha_dinamica>
    ${resp_login}=    POST On Session    ${SESSION_NAME}    
    ...                /login    json=${payload_login}    
    ...                expected_status=any
    ${token}=    Set Variable    ${resp_login.json()}[authorization]
    ${headers}=    Create Dictionary    Authorization=${token}
    ${resposta}=    DELETE On Session    ${SESSION_NAME}    
    ...                /usuarios/${id_usuario}    
    ...                headers=${headers}    
    ...                expected_status=any
    Validar Status e Mensagem    ${resposta}    200    Registro excluído com sucesso
    Log To Console    Usuário dinâmico excluído com sucesso

DELETE Endpoint /produtos dinamico
    [Documentation]    Testa a exclusão de produto dinamicamente
    ${usuario_admin}=    Criar Usuario Dinamico Completo    eh_admin=true
    ${payload_login}=    Create Dictionary
    ...    email=${usuario_admin}[email]
    ...    password=<senha_dinamica>
    ${resp_login}=    POST On Session    ${SESSION_NAME}    
    ...                /login    
    ...                json=${payload_login}    
    ...                expected_status=any
    ${token}=    Set Variable    ${resp_login.json()}[authorization]
    ${produto_criado}=    Criar Produto Dinamico    ${token}
    ${id_produto}=    Set Variable    ${produto_criado}[data][_id]
    ${headers}=    Create Dictionary    Authorization=${token}
    ${resposta}=    DELETE On Session    ${SESSION_NAME}    
    ...                /produtos/${id_produto}    
    ...                headers=${headers}    
    ...                expected_status=any
    Validar Status e Mensagem    ${resposta}    200    Registro excluído com sucesso
    Log To Console    Produto dinâmico excluído com sucesso

DELETE Endpoint /carrinhos/concluir-compra dinamico
    [Documentation]    Testa a conclusão de compra do carrinho dinamicamente
    ${usuario_admin}=    Criar Usuario Dinamico Completo    eh_admin=true
    ${payload_login}=    Create Dictionary
    ...    email=${usuario_admin}[email]
    ...    password=<senha_dinamica>
    ${resp_login}=    POST On Session    ${SESSION_NAME}    
    ...                /login    json=${payload_login}    
    ...                expected_status=any
    ${token}=    Set Variable    ${resp_login.json()}[authorization]
    ${produto_criado}=    Criar Produto Dinamico    ${token}
    ${id_produto}=    Set Variable    ${produto_criado}[data][_id]
    ${produto_item}=    Create Dictionary    
    ...                idProduto=${id_produto}    
    ...                quantidade=1
    ${produtos_list}=    Create List    ${produto_item}
    ${payload_carrinho}=    Create Dictionary    
    ...                 produtos=${produtos_list}
    ${headers}=    Create Dictionary    Authorization=${token}
    ${resposta_carrinho}=    POST On Session    ${SESSION_NAME}    
    ...                  /carrinhos    
    ...                  json=${payload_carrinho}    
    ...                  headers=${headers}
    ${resposta}=    DELETE On Session    ${SESSION_NAME}    
    ...                  /carrinhos/concluir-compra    
    ...                  headers=${headers}    
    ...                  expected_status=any
    Validar Status e Mensagem    ${resposta}    200    Registro excluído com sucesso
    Log To Console    Compra de carrinho dinâmico concluída com sucesso

DELETE Endpoint /carrinhos/cancelar-compra dinamico
    [Documentation]    Testa o cancelamento de compra do carrinho dinamicamente
    ${usuario_admin}=    Criar Usuario Dinamico Completo    eh_admin=true
    ${payload_login}=    Create Dictionary
    ...                email=${usuario_admin}[email]
    ...                password=<senha_dinamica>
    ${resp_login}=    POST On Session    ${SESSION_NAME}    
    ...                /login        
    ...                json=${payload_login}    
    ...                expected_status=any
    ${token}=    Set Variable    ${resp_login.json()}[authorization]
    ${produto_criado}=    Criar Produto Dinamico    ${token}
    ${id_produto}=    Set Variable    ${produto_criado}[data][_id]
    ${produto_item}=    Create Dictionary        
    ...                 idProduto=${id_produto}    
    ...                 quantidade=1
    ${produtos_list}=    Create List    ${produto_item}
    ${payload_carrinho}=    Create Dictionary    
    ...                  produtos=${produtos_list}
    ${headers}=    Create Dictionary    Authorization=${token}
    ${resposta_carrinho}=    POST On Session    ${SESSION_NAME}    
    ...                  /carrinhos    
    ...                  json=${payload_carrinho}    
    ...                  headers=${headers}
    ${resposta}=    DELETE On Session    ${SESSION_NAME}   
    ...                 /carrinhos/cancelar-compra    
    ...                 headers=${headers}    
    ...                 expected_status=any
    Validar Status e Mensagem    ${resposta}    200    Registro excluído com sucesso. Estoque dos produtos reabastecido
    Log To Console    Compra de carrinho dinâmico cancelada com sucesso