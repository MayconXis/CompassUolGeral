*** Settings ***
Documentation    Keywords estáticas para a API Serverest - Cobertura completa
Library          RequestsLibrary
Library          String
Library          Collections
Library          DateTime
Resource         keywords_validacao.robot

*** Keywords ***

POST Endpoint /usuarios admin estatico
    [Documentation]    Testa cadastro de usuário admin com dados estáticos
    Criar Sessão na serverest API
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload}=    Create Dictionary
    ...    nome=Admin Teste Estatico ${timestamp}
    ...    email=adminestatico${timestamp}@qa.com
    ...    password=testando123
    ...    administrador=true
    ${resposta}=    POST On Session    serverest_api    /usuarios    json=${payload}    expected_status=any
    Validar Status e Mensagem    ${resposta}    201    Cadastro realizado com sucesso
    Log To Console    Usuário admin estático criado com sucesso
POST Endpoint /usuarios estatico
    [Documentation]    Testa cadastro de usuário admin com dados estáticos
    Criar Sessão na serverest API
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload}=    Create Dictionary
    ...    nome=Admin Teste Estatico ${timestamp}
    ...    email=adminestatico${timestamp}@qa.com
    ...    password=testando123
    ...    administrador=false
    ${resposta}=    POST On Session    serverest_api    /usuarios    json=${payload}    expected_status=any
    Validar Status e Mensagem    ${resposta}    201    Cadastro realizado com sucesso
    Log To Console    Usuário admin estático criado com sucesso


POST Endpoint /usuarios duplicado estatico
    [Documentation]    Testa cadastro de usuário com email já existente
    Criar Sessão na serverest API
    ${payload}=    Create Dictionary
    ...    nome=Usuario Duplicado
    ...    email=fulano@qa.com
    ...    password=teste
    ...    administrador=false
    ${resposta}=    POST On Session    serverest_api    /usuarios    json=${payload}    expected_status=any
    Validar Status e Mensagem    ${resposta}    400    Este email já está sendo usado
    Log To Console    Teste de email duplicado executado

POST Endpoint /login estatico
    [Documentation]    Testa login com credenciais válidas estáticas
    Criar Sessão na serverest API
    ${payload}=    Create Dictionary
    ...    email=fulano@qa.com
    ...    password=teste
    ${resposta}=    POST On Session    serverest_api    /login    json=${payload}    expected_status=any
    Validar Status e Mensagem    ${resposta}    200    Login realizado com sucesso
    ${token}=    Get From Dictionary    ${resposta.json()}    authorization
    Should Not Be Empty    ${token}
    Log To Console    Login estático realizado com sucesso

POST Endpoint /login credenciais invalidas estatico
    [Documentation]    Testa login com credenciais inválidas estáticas
    Criar Sessão na serverest API
    ${payload}=    Create Dictionary
    ...    email=usuario.inexistente@teste.com
    ...    password=senha_incorreta
    ${resposta}=    POST On Session    serverest_api    /login    json=${payload}    expected_status=any
    Validar Status e Mensagem    ${resposta}    401    Email e/ou senha inválidos
    Log To Console    Teste de credenciais inválidas executado

POST Endpoint /login multiplos incorretos estatico
    [Documentation]    Testa múltiplos logins com senha incorreta
    Criar Sessão na serverest API
    FOR    ${i}    IN RANGE    3
        ${payload}=    Create Dictionary
        ...    email=fulano@qa.com
        ...    password=senha_incorreta_${i}
        ${resposta}=    POST On Session    serverest_api    /login    json=${payload}    expected_status=any
        Validar Status e Mensagem    ${resposta}    401    Email e/ou senha inválidos
        Log To Console    Tentativa ${i+1} de login incorreto executada
    END

POST Endpoint /produtos estatico
    [Documentation]    Testa criação de produto com dados estáticos
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload}=    Create Dictionary
    ...    nome=Produto Teste Estatico ${timestamp}
    ...    preco=100
    ...    descricao=Produto de teste com dados estaticos
    ...    quantidade=50
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    POST On Session    serverest_api    /produtos    json=${payload}    headers=${headers}    expected_status=any
    Validar Status e Mensagem    ${resposta}    201    Cadastro realizado com sucesso
    Log To Console    Produto estático criado com sucesso

POST Endpoint /produtos duplicado estatico
    [Documentation]    Testa criação de produto com nome duplicado
    Criar e Logar Usuário Admin
    ${payload}=    Create Dictionary
    ...    nome=Logitech MX Vertical
    ...    preco=200
    ...    descricao=Produto duplicado estatico
    ...    quantidade=10
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    POST On Session    serverest_api    /produtos    json=${payload}    headers=${headers}    expected_status=any
    Validar Status e Mensagem    ${resposta}    400    Já existe produto com esse nome
    Log To Console    Teste de produto duplicado executado

POST Endpoint /produtos preco negativo estatico
    [Documentation]    Testa criação de produto com preço negativo
    Logar Usuario Admin Existente
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload}=    Create Dictionary
    ...    nome=Produto Preco Negativo Estatico ${timestamp}
    ...    preco=-10
    ...    descricao=Produto com preço negativo
    ...    quantidade=-50
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    POST On Session    serverest_api    /produtos    json=${payload}    headers=${headers}    expected_status=any
    Should Be Equal As Numbers    ${resposta.status_code}    400
    Should Contain    ${resposta.json()}[preco]    preco deve ser um número positivo
    Log To Console    Teste de preço negativo executado

POST Endpoint /produtos quantidade negativa estatico
    [Documentation]    Testa criação de produto com quantidade negativa
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload}=    Create Dictionary
    ...    nome=Produto Quantidade Negativa Estatico ${timestamp}
    ...    preco=100
    ...    descricao=Produto com quantidade negativa
    ...    quantidade=-10
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    POST On Session    serverest_api    /produtos    json=${payload}    headers=${headers}    expected_status=any
    Should Be Equal As Numbers    ${resposta.status_code}    400
    Should Contain    ${resposta.json()}[quantidade]    quantidade deve ser maior ou igual a 0
    Log To Console    Teste de quantidade negativa executado

POST Endpoint /produtos sem token estatico
    [Documentation]    Testa criação de produto sem token de autorização
    Criar Sessão na serverest API
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload}=    Create Dictionary
    ...    nome=Produto Sem Token Estatico ${timestamp}
    ...    preco=100
    ...    descricao=Produto sem token
    ...    quantidade=10
    ${resposta}=    POST On Session    serverest_api    /produtos    json=${payload}    expected_status=any
    Validar Status e Mensagem    ${resposta}    401    Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
    Log To Console    Teste sem token executado

POST Endpoint /carrinhos estatico
    [Documentation]    Testa criação de carrinho com dados estáticos
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload_usuario}=    Create Dictionary
    ...    nome=Usuario Carrinho ${timestamp}
    ...    email=carrinho${timestamp}@qa.com
    ...    password=teste123
    ...    administrador=true
    
    Criar Sessão na serverest API
    ${resposta_usuario}=    POST On Session    serverest_api    /usuarios    json=${payload_usuario}    expected_status=any
    ${payload_login}=    Create Dictionary
    ...    email=${payload_usuario}[email]
    ...    password=${payload_usuario}[password]
    ${resposta_login}=    POST On Session    serverest_api    /login    json=${payload_login}
    ${TOKEN}=    Get From Dictionary    ${resposta_login.json()}    authorization
    ${payload_produto}=    Create Dictionary
    ...    nome=Produto Para Carrinho Estatico ${timestamp}
    ...    preco=150
    ...    descricao=Produto para teste de carrinho
    ...    quantidade=20
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta_produto}=    POST On Session    serverest_api    /produtos    json=${payload_produto}    headers=${headers}
    ${id_produto}=    Get From Dictionary    ${resposta_produto.json()}    _id
    
    ${produto_item}=    Create Dictionary    idProduto=${id_produto}    quantidade=2
    ${produtos_list}=    Create List    ${produto_item}
    ${payload_carrinho}=    Create Dictionary    produtos=${produtos_list}
    ${resposta}=    POST On Session    serverest_api    /carrinhos    json=${payload_carrinho}    headers=${headers}    expected_status=any
    Validar Status e Mensagem    ${resposta}    201    Cadastro realizado com sucesso
    Log To Console    Carrinho estático criado com sucesso

GET Endpoint /usuarios estatico
    [Documentation]    Testa listagem de usuários
    Criar Sessão na serverest API
    ${resposta}=    GET On Session    serverest_api    /usuarios    expected_status=any
    Validar Status GET    ${resposta}    200
    Should Contain    ${resposta.json()}    usuarios
    Log To Console    Lista de usuários obtida com sucesso

GET Endpoint /usuarios/id valido estatico
    [Documentation]    Testa busca de usuário por ID válido
    Criar e Logar Usuário Admin
    ${resposta}=    GET On Session    serverest_api    /usuarios/${ID_USUARIO}    expected_status=any
    Validar Status GET    ${resposta}    200
    Should Be Equal    ${resposta.json()}[nome]    ${NOME_USUARIO}
    Log To Console    Usuário por ID válido obtido com sucesso

GET Endpoint /usuarios/id invalido estatico
    [Documentation]    Testa busca de usuário por ID inválido
    Criar Sessão na serverest API
    ${resposta}=    GET On Session    serverest_api    /usuarios/999999999999999999999999    expected_status=any
    Should Be Equal As Numbers    ${resposta.status_code}    400
    Should Be Equal    ${resposta.json()}[id]    id deve ter exatamente 16 caracteres alfanuméricos
    Log To Console    Teste de ID inválido executado

GET Endpoint /produtos estatico
    [Documentation]    Testa listagem de produtos
    Criar Sessão na serverest API
    ${resposta}=    GET On Session    serverest_api    /produtos    expected_status=any
    Validar Status GET    ${resposta}    200
    Should Contain    ${resposta.json()}    produtos
    Log To Console    Lista de produtos obtida com sucesso

GET Endpoint /produtos/id valido estatico
    [Documentation]    Testa busca de produto por ID válido
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload_produto}=    Create Dictionary
    ...    nome=Produto Para Busca Estatico ${timestamp}
    ...    preco=75
    ...    descricao=Produto para teste de busca
    ...    quantidade=15
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta_post}=    POST On Session    serverest_api    /produtos    json=${payload_produto}    headers=${headers}
    ${id_produto}=    Get From Dictionary    ${resposta_post.json()}    _id
    
    ${resposta}=    GET On Session    serverest_api    
    ...                /produtos/${id_produto}    
    ...                expected_status=any
    Validar Status GET    ${resposta}    200
    Log To Console    Produto por ID válido obtido com sucesso

GET Endpoint /produtos/id invalido estatico
    [Documentation]    Testa busca de produto por ID inválido
    Criar Sessão na serverest API
    ${resposta}=    GET On Session    serverest_api    
    ...            /produtos/999999999999999999999999    
    ...            expected_status=any
    Should Be Equal As Numbers    ${resposta.status_code}    400
    Should Be Equal    ${resposta.json()}[id]    id deve ter exatamente 16 caracteres alfanuméricos
    Log To Console    Teste de produto ID inválido executado

GET Endpoint /carrinhos estatico
    [Documentation]    Testa listagem de carrinhos
    Criar Sessão na serverest API
    ${resposta}=    GET On Session    serverest_api    
    ...              /carrinhos    
    ...               expected_status=any
    Validar Status GET    ${resposta}    200
    Should Contain    ${resposta.json()}    carrinhos
    Log To Console    Lista de carrinhos obtida com sucesso
GET Endpoint /produtos com ID nao encontrado
    [Documentation]    Testa a busca de um produto com um ID válido, mas que não existe no banco de dados.
    Criar Sessão na serverest API
    ${id_produto_nao_encontrado}=    Set Variable    60c87a5445d1f80020d2d3d4
    ${resposta}=    GET On Session    serverest_api    
    ...            /produtos/${id_produto_nao_encontrado}    
    ...            expected_status=any
    Should Be Equal    ${resposta.json()}[id]    id deve ter exatamente 16 caracteres alfanuméricos

PUT Endpoint /produtos sem alteracao estatico
    [Documentation]    Testa a atualização de um produto com os mesmos dados originais.
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${nome_produto_original}=    Set Variable    Produto Sem Alteracao Estatico ${timestamp}
    
    ${payload_produto}=    Create Dictionary
    ...              nome=${nome_produto_original}
    ...              preco=200
    ...              descricao=Produto que nao sera alterado
    ...              quantidade=25
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta_post}=    POST On Session    serverest_api    /produtos    json=${payload_produto}    headers=${headers}    expected_status=201
    ${id_produto}=    Get From Dictionary    ${resposta_post.json()}    _id
    ${resposta_put}=    PUT On Session    serverest_api    
    ...                /produtos/${id_produto}    
    ...                json=${payload_produto}    
    ...                headers=${headers}    
    ...                expected_status=any
    Validar Status e Mensagem    ${resposta_put}    200    Registro alterado com sucesso
PUT Endpoint /usuarios estatico
    [Documentation]    Testa atualização de usuário
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload_atualizado}=    Create Dictionary
    ...    nome=Usuario Atualizado Estatico ${timestamp}
    ...    email=usuario.atualizado.estatico${timestamp}@teste.com
    ...    password=nova_senha123
    ...    administrador=false
    ${resposta}=    PUT On Session    serverest_api    /usuarios/${ID_USUARIO}    json=${payload_atualizado}    expected_status=any
    Validar Status e Mensagem    ${resposta}    200    Registro alterado com sucesso
    Log To Console    Usuário atualizado com sucesso

PUT Endpoint /produtos estatico
    [Documentation]    Testa atualização de produto
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload_produto}=    Create Dictionary
    ...    nome=Produto Para Atualizar Estatico ${timestamp}
    ...    preco=200
    ...    descricao=Produto para teste de atualização
    ...    quantidade=25
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta_post}=    POST On Session    serverest_api    /produtos    json=${payload_produto}    headers=${headers}
    ${id_produto}=    Get From Dictionary    ${resposta_post.json()}    _id
    
    ${payload_atualizado}=    Create Dictionary
    ...    nome=Produto Atualizado Estatico ${timestamp}
    ...    preco=250
    ...    descricao=Produto atualizado com dados estaticos
    ...    quantidade=30
    ${resposta}=    PUT On Session    serverest_api    /produtos/${id_produto}    json=${payload_atualizado}    headers=${headers}    expected_status=any
    Validar Status e Mensagem    ${resposta}    200    Registro alterado com sucesso
    Log To Console    Produto atualizado com sucesso

PUT Endpoint /produtos preco negativo estatico
    [Documentation]    Testa atualizacao de produto com preco negativo
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload_produto}=    Create Dictionary
    ...    nome=Produto Preco Negativo Update Estatico ${timestamp}
    ...    preco=50
    ...    descricao=Produto para teste de atualizacao com preco negativo
    ...    quantidade=50
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta_post}=    POST On Session    serverest_api    /produtos    json=${payload_produto}    headers=${headers}    expected_status=201
    ${id_produto}=    Get From Dictionary    ${resposta_post.json()}    _id

    ${payload_atualizado}=    Create Dictionary
    ...    nome=Produto Atualizado Com Preco Negativo Estatico ${timestamp}
    ...    preco=-10
    ...    descricao=Preco negativo
    ...    quantidade=20
    ${resposta_put}=    PUT On Session    serverest_api    /produtos/${id_produto}    json=${payload_atualizado}    headers=${headers}    expected_status=any
    Validar Preço Negativo    ${resposta_put}    400    preco    preco deve ser um número positivo
    Log To Console    Teste de atualização de produto com preço negativo executado

PUT Endpoint /produtos quantidade negativa estatico
    [Documentation]    Testa atualizacao de produto com quantidade negativa
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload_produto}=    Create Dictionary
    ...    nome=Produto Quantidade Negativa Update Estatico ${timestamp}
    ...    preco=50
    ...    descricao=Produto para teste de atualizacao com quantidade negativa
    ...    quantidade=50
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta_post}=    POST On Session    serverest_api    /produtos    json=${payload_produto}    headers=${headers}    expected_status=201
    ${id_produto}=    Get From Dictionary    ${resposta_post.json()}    _id

    ${payload_atualizado}=    Create Dictionary
    ...    nome=Produto Atualizado Com Quantidade Negativa Estatico ${timestamp}
    ...    preco=30
    ...    descricao=Quantidade negativa
    ...    quantidade=-10
    ${resposta_put}=    PUT On Session    serverest_api    /produtos/${id_produto}    json=${payload_atualizado}    headers=${headers}    expected_status=any
    Validar Quantidade Negativa    ${resposta_put}    400    quantidade    quantidade deve ser maior ou igual a 0
    Log To Console    Teste de atualização de produto com quantidade negativa executado

PUT Endpoint /produtos sem token estatico
    [Documentation]    Testa atualizacao de produto sem token de autorizacao
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload_produto}=    Create Dictionary
    ...    nome=Produto Sem Token Update Estatico ${timestamp}
    ...    preco=50
    ...    descricao=Produto para teste de atualizacao sem token
    ...    quantidade=50
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta_post}=    POST On Session    serverest_api    /produtos    json=${payload_produto}    headers=${headers}    expected_status=201
    ${id_produto}=    Get From Dictionary    ${resposta_post.json()}    _id

    ${payload_atualizado}=    Create Dictionary
    ...    nome=Produto Atualizado Sem Token Estatico ${timestamp}
    ...    preco=30
    ...    descricao=Atualizacao sem token
    ...    quantidade=20
    ${resposta_put}=    PUT On Session    serverest_api    /produtos/${id_produto}    json=${payload_atualizado}    expected_status=any
    Validar Status e Mensagem    ${resposta_put}    401    Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
    Log To Console    Teste de atualização de produto sem token executado

PUT Endpoint /usuarios email duplicado estatico
    [Documentation]    Testa atualizacao de usuario com email ja existente
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload_novo_usuario}=    Create Dictionary
    ...    nome=Usuario Email Duplicado Estatico ${timestamp}
    ...    email=usuario.para.atualizar${timestamp}@teste.com
    ...    password=teste123
    ...    administrador=false
    ${resposta_post}=    POST On Session    serverest_api    /usuarios    json=${payload_novo_usuario}    expected_status=201
    ${id_usuario_para_atualizar}=    Get From Dictionary    ${resposta_post.json()}    _id

    ${email_existente}=    Set Variable    fulano@qa.com
    ${payload_atualizado}=    Create Dictionary
    ...    nome=Usuario Com Email Duplicado ${timestamp}
    ...    email=${email_existente}
    ...    password=senha_nova
    ...    administrador=false
    ${resposta_put}=    PUT On Session    serverest_api    /usuarios/${id_usuario_para_atualizar}    json=${payload_atualizado}    expected_status=any
    Validar Status e Mensagem    ${resposta_put}    400    Este email já está sendo usado
    Log To Console    Teste de atualização de usuário com email duplicado executado

PUT Endpoint /produtos nome duplicado estatico
    [Documentation]    Testa atualizacao de produto com nome ja existente
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload_produto_1}=    Create Dictionary
    ...                  nome=Produto Duplicado Estatico 1 ${timestamp}
    ...                  preco=100
    ...                  descricao=Produto 1 para teste de nome duplicado
    ...                  quantidade=10
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta_post_1}=    POST On Session    serverest_api    
    ...                      /produtos    
    ...                      json=${payload_produto_1}    
    ...                      headers=${headers}    
    ...                      expected_status=201
    ${id_produto_1}=    Get From Dictionary    ${resposta_post_1.json()}    _id

    ${payload_produto_2}=    Create Dictionary
    ...                        nome=Produto Duplicado Estatico 2 ${timestamp}
    ...                        preco=200
    ...                        descricao=Produto 2 para teste de nome duplicado
    ...                        quantidade=20
    ${resposta_post_2}=    POST On Session    serverest_api    
    ...                        /produtos    
    ...                        json=${payload_produto_2}    
    ...                        headers=${headers}    
    ...                        expected_status=201
    ${id_produto_2}=    Get From Dictionary    ${resposta_post_2.json()}    _id

    ${payload_atualizado}=    Create Dictionary
    ...                    nome=${payload_produto_1}[nome]
    ...                    preco=250
    ...                    descricao=Nome duplicado
    ...                    quantidade=30
    ${resposta_put}=    PUT On Session    serverest_api    
    ...                    /produtos/${id_produto_2}    
    ...                    json=${payload_atualizado}    
    ...                    headers=${headers}    
    ...                    expected_status=any
    Validar Status e Mensagem    ${resposta_put}    400    Já existe produto com esse nome
    Log To Console    Teste de atualização de produto com nome duplicado executado


DELETE Endpoint /produtos estatico
    [Documentation]    Testa exclusão de produto
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload_produto}=    Create Dictionary
    ...                    nome=Produto Para Deletar Estatico ${timestamp}
    ...                    preco=300
    ...                    descricao=Produto para teste de exclusão
    ...                    quantidade=5
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta_post}=    POST On Session    serverest_api    /produtos    json=${payload_produto}    headers=${headers}
    ${id_produto}=    Get From Dictionary    ${resposta_post.json()}    _id
    
    ${resposta}=    DELETE On Session    serverest_api    
    ...                    /produtos/${id_produto}    
    ...                    headers=${headers}    expected_status=any
    Validar Status e Mensagem    ${resposta}    200    Registro excluído com sucesso
    Log To Console    Produto excluído com sucesso

DELETE Endpoint /carrinhos/cancelar-compra estatico
    [Documentation]    Testa cancelamento de compra do carrinho
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload_produto}=    Create Dictionary
    ...    nome=Produto Para Cancelar Estatico ${timestamp}
    ...    preco=180
    ...    descricao=Produto para teste de cancelamento
    ...    quantidade=12
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta_produto}=    POST On Session    serverest_api    /produtos    json=${payload_produto}    headers=${headers}
    ${id_produto}=    Get From Dictionary    ${resposta_produto.json()}    _id
    
    ${produto_item}=    Create Dictionary    
    ...                    idProduto=${id_produto}    
    ...                    quantidade=1
    ${produtos_list}=    Create List    ${produto_item}
    ${payload_carrinho}=    Create Dictionary    produtos=${produtos_list}
    ${resposta_carrinho}=    POST On Session    serverest_api   
    ...                    /carrinhos    
    ...                    json=${payload_carrinho}    
    ...                    headers=${headers}
    
    ${resposta}=    DELETE On Session    serverest_api    
    ...                   /carrinhos/cancelar-compra    
    ...                   headers=${headers}    
    ...                   expected_status=any
    Validar Status e Mensagem    ${resposta}    200    Registro excluído com sucesso. Estoque dos produtos reabastecido
    Log To Console    Compra cancelada com sucesso

DELETE Endpoint /carrinhos/concluir-compra estatico
    [Documentation]    Testa conclusão de compra do carrinho
    Criar e Logar Usuário Admin
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${payload_produto}=    Create Dictionary
    ...                    nome=Produto Para Concluir Estatico ${timestamp}
    ...                    preco=220
    ...                    descricao=Produto para teste de conclusão
    ...                    quantidade=8
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta_produto}=    POST On Session    serverest_api    
    ...                    /produtos    
    ...                    json=${payload_produto}    
    ...                    headers=${headers}
    ${id_produto}=    Get From Dictionary    ${resposta_produto.json()}    _id
    
    ${produto_item}=    Create Dictionary    
    ...                    idProduto=${id_produto}    
    ...                    quantidade=1
    ${produtos_list}=    Create List    ${produto_item}
    ${payload_carrinho}=    Create Dictionary    produtos=${produtos_list}
    ${resposta_carrinho}=    POST On Session    serverest_api    
    ...                        /carrinhos    
    ...                        json=${payload_carrinho}    
    ...                        headers=${headers}
    
    ${resposta}=    DELETE On Session    serverest_api    /carrinhos/concluir-compra    headers=${headers}    expected_status=any
    Validar Status e Mensagem    ${resposta}    200    Registro excluído com sucesso
    Log To Console    Compra concluída com sucesso

DELETE Endpoint /usuarios estatico
    [Documentation]    Testa exclusao de usuario
    Criar e Logar Usuário Admin
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${resposta}=    DELETE On Session    
    ...                serverest_api    
    ...                /usuarios/${ID_USUARIO}    
    ...                headers=${headers}    
    ...                expected_status=any
    Validar Status e Mensagem    ${resposta}    200    Registro excluído com sucesso
    Log To Console    Usuário excluído com sucesso

DELETE Endpoint /produtos com ID de usuario
    [Documentation]    Testa a tentativa de deletar um produto usando um ID de usuário.
    Logar Usuario Admin Existente
    ${headers}=    Create Dictionary    Authorization=${TOKEN}
    ${id_usuario_fake}=    Set Variable    BeeJh5lz3k6kSIzA
    ${resposta}=    DELETE On Session    serverest_api    
    ...                /produtos/${id_usuario_fake}   
    ...                headers=${headers}    
    ...                expected_status=any
    Should Be Equal As Numbers    ${resposta.status_code}    403
    Should Be Equal    ${resposta.json()}[message]    Rota exclusiva para administradores
    Log To Console    Teste de exclusão com ID de usuário executado
