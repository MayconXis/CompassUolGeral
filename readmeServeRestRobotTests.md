### **🚀Desafio de Qualidade: Análise Completa da API ServeRest**

Este projeto foi desenvolvido como um **desafio individual para a Compass UOL**, com o objetivo de aplicar minhas habilidades de teste de API com acremento de ROBOT Framework em uma aplicação real, a API ServeRest.

A automação foi construída utilizando o **Robot Framework**.

O foco principal está na **validação de requisições HTTP** e na interação com uma **Serve Rest**. Para isso, foi utilizada a **[Reqres API](https://compassuol.serverest.dev)** como ambiente de testes, possibilitando a exploração dos verbos HTTP:

- **GET** - Consulta de dados
- **POST** - Criação de recursos
- **PUT** - Atualização completa
- **DELETE** - Remoção de recursos

Além disso, foram incluídos cenários envolvendo **autenticação**, **validação de erros** e **respostas em diferentes contextos**.

---

## 🛠️ Requisitos e Tecnologias
- **Python 3.6+**
- **Robot Framework**
- **RequestsLibrary** para requisições HTTP
- **JSONLibrary** para manipulação de dados JSON
- Dependências listadas em `requirements.txt`

---
### **`Primeira Parte do Projeto**
---

#### **1. Planejamento Testes Postman e Manuais**

Comecei a primeira do meu trabalho com uma análise completa da aplicação. Identifiquei os **riscos mais críticos**, como falhas de autenticação e inconsistências na lógica de negócio, para direcionar meus esforços de teste. Em seguida, escolhi as técnicas que eu usaria para cobrir a maior parte do sistema, incluindo **Testes CRUD** para as funcionalidades básicas e **Testes de Lógica de Negócio** para garantir que as regras de negócio fossem respeitadas.

#### **2. Cenários e Priorização Testes Postman e Manuais**

Eu mapeei os principais cenários de teste para as APIs de usuários, produtos e carrinhos. Para ter certeza de que eu estava focando no que realmente importava, criei uma **matriz de risco**. Com ela, eu classifiquei cada cenário por probabilidade e impacto, o que me permitiu priorizar a execução dos testes mais críticos.

#### **3. Execução e Descobertas Testes Postman e Manuais**

Eu conduzi todos os testes individualmente, explorando a API e a interface web para encontrar problemas. O foco foi validar os fluxos principais e, ao mesmo tempo, documentar qualquer comportamento inesperado.

Durante essa fase, encontrei diversos bugs e oportunidades de melhoria que eu documentei no formato de issues de Jira, prontos para serem corrigidos.

### **📊 Meus Resultados Testes Postman e Manuais **

Enquanto testava, descobri problemas que afetavam tanto a API quanto a usabilidade do site. Aqui estão os principais achados:

* **Bugs Críticos:** Encontrei problemas na **lógica de negócio**, como a possibilidade de adicionar produtos ao carrinho mesmo com estoque zero, o que é um erro grave.
* **Bugs de Usabilidade:** O **layout do site não é responsivo**, o que o torna inutilizável em celulares.
* **Inconsistências da API:** Percebi que a API retorna **status codes incorretos**, como `200 OK` para recursos que não existem, o que pode confundir outros desenvolvedores.
* **Funcionalidades Ausentes:** Detectei a falta de funcionalidades básicas de **edição e exclusão de usuários**, e de remoção de itens individuais do carrinho.

### **📋 Plano de Trabalho & Metodologia**

Minha abordagem de teste se baseou em um processo estruturado, utilizando ferramentas e metodologias para garantir a qualidade.

1.  **Planejamento Estratégico:** Iniciei com uma **análise completa da API**, identificando os riscos mais críticos.Meus esforços se concentraram em validar as regras de negócio e a lógica de autenticação e de fluxos de compra.
2.  **Cenários e Priorização:** Mapeei os principais cenários de teste para as APIs de usuários, produtos e carrinhos. Para garantir o foco no que realmente importava, criei uma **matriz de risco** para priorizar a execução dos cenários mais críticos].
3.  **Metodologia QAlity:** Para documentar e acompanhar o progresso, adotei a metodologia **QAlity**, que utiliza arquivos CSV para documentar os cenários. Com isso, pude separar claramente os testes já executados e automatizados em `QAlity_executados.csv`  dos cenários que ainda precisavam de atenção em `QAlity_nao_executados.csv`.

---

### **🚀 Automação com Robot Framework**

A automação foi a peça-chave para a execução eficiente dos testes.A arquitetura foi construída para ser modular e escalável, seguindo boas práticas do Robot Framework, que utiliza keywords de asserção e validação.

#### **Estrutura de Pastas e Arquivos**


├── common/

│   ├── dynamic_keywords.robot

│   ├── keywords_statics.robot

│   ├── keywords_validacao.robot

│   ├── static_variables.robot

│   └── base.robot

├── resources/

│   ├── banco_dados.resource

│   └── banco_.json

├── QAlityJira/

├── QAlity_executados_.csv

├── QAlity_nao_executados_.csv

├── data/
│   ├── banco_endpoints.json

│   ├── banco_produtos.json

│   ├── banco_status_codes.json

│   └── banco_usuarios.json

├── tests/
│   ├── api_dynamic_tests.robot

│   ├── api_test_static.robot

│   ├── manipulacao_banco_json.robot

│   ├── json_manipulacao.robot

│   └── manipulacao_json_test.robot

## Estrutura dos Arquivos Banco de Dados

### Bancos de Dados JSON
- `data/banco_produtos.json` -Dados de produtos, IDS e recursos 
- `data/banco_usuarios.json` - Dados de usuários, IDs e recursos  
- `data/banco_endpoints.json` - Dados de endpoints e payloads  
- `data/banco_status_codes.json` - Status codes esperados por operação
- `resources/banco_dados.resource` - Keywords para carregar dados dos bancos  
- `resources/manipular_json.resource` - Keywords para manipular dados JSON  
- `resources/api_usuarios.resource` - Keywords da API (modificado para usar dados dinâmicos)  


### Cenários de Teste com Robot Framework (CT)

#### Cenários de Usuários

* **Cenário 01: POST Cadastrar usuário comum estático**
    * **Test Step:** Realizar uma requisição POST com dados estáticos para criar um usuário comum.
    * **Expected Result:** O usuário é criado com sucesso, retornando o status code 201 e a mensagem 'Cadastro realizado com sucesso'.

* **Cenário 02: POST Cadastrar usuário admin estático**
    * **Test Step:** Realizar uma requisição POST com dados estáticos para criar um usuário admin.
    * **Expected Result:** O usuário admin é criado com sucesso, retornando o status code 201 e a mensagem 'Cadastro realizado com sucesso'.

* **Cenário 03: POST Cadastrar usuário com email existente estático**
    * **Test Step:** Tentar criar um usuário usando um email que já está cadastrado.
    * **Expected Result:** A requisição falha, retornando o status code 400 e a mensagem 'Este email já está sendo usado'.

* **Cenário 04: POST Login com credenciais válidas estático**
    * **Test Step:** Realizar uma requisição POST com email e senha válidos.
    * **Expected Result:** O login é bem-sucedido, retornando o status code 200 e a mensagem 'Login realizado com sucesso'.

* **Cenário 05: POST Login com credenciais inválidas estático**
    * **Test Step:** Tentar realizar login com um email ou senha que não correspondem a um usuário existente.
    * **Expected Result:** O login falha, retornando o status code 401 e a mensagem 'Email e/ou senha inválidos'.

* **Cenário 06: POST Múltiplos logins incorretos estático**
    * **Test Step:** Tentar logar várias vezes com a mesma credencial de usuário, mas com senhas diferentes e incorretas.
    * **Expected Result:** Cada tentativa de login falha, retornando o status code 401 e a mensagem 'Email e/ou senha inválidos'.

* **Cenário 13: GET Listar usuários estático**
    * **Test Step:** Realizar uma requisição GET para o endpoint de usuários.
    * **Expected Result:** A requisição é bem-sucedida, retornando o status code 200 e a lista de usuários.

* **Cenário 14: GET Obter usuário por ID válido estático**
    * **Test Step:** Criar um usuário e buscar por seu ID para validar o retorno dos dados.
    * **Expected Result:** A requisição é bem-sucedida, retornando o status code 200 e os dados do usuário correspondente.

* **Cenário 15: GET Obter usuário por ID inválido estático**
    * **Test Step:** Tentar buscar um usuário utilizando um ID que não tem o formato alfanumérico correto.
    * **Expected Result:** A requisição falha, retornando o status code 400 e a mensagem 'id deve ter exatamente 16 caracteres alfanuméricos'.

* **Cenário 22: PUT Atualizar usuário estático**
    * **Test Step:** Criar um usuário e atualizá-lo com novos dados estáticos.
    * **Expected Result:** A atualização é bem-sucedida, retornando o status code 200 e a mensagem 'Registro alterado com sucesso'.

* **Cenário 28: PUT Atualizar usuario com email duplicado estatico**
    * **Test Step:** Tentar atualizar o email de um usuário para um email que já está cadastrado por outro usuário.
    * **Expected Result:** A atualização falha, retornando o status code 400 e a mensagem 'Este email já está sendo usado'.

* **Cenário 33: DELETE Excluir usuario estatico**
    * **Test Step:** Criar um usuário admin e excluí-lo utilizando seu ID e um token válido.
    * **Expected Result:** O usuário é excluído com sucesso, retornando o status code 200 e a mensagem 'Registro excluído com sucesso'.

* **Cenário 35: POST Cadastrar usuário dinâmico**
    * **Test Step:** Criar um usuário com dados dinâmicos.
    * **Expected Result:** O usuário é criado com sucesso, retornando o status code 201 e a mensagem 'Cadastro realizado com sucesso'.

* **Cenário 36: POST Login usuário dinâmico**
    * **Test Step:** Realizar login com um usuário dinâmico e validar a resposta.
    * **Expected Result:** O login é bem-sucedido, retornando o status code 200 e a mensagem 'Login realizado com sucesso'.

* **Cenário 39: POST Registro com email existente dinâmico**
    * **Test Step:** Criar um usuário dinâmico e, em seguida, tentar criar um segundo usuário com o mesmo email.
    * **Expected Result:** O sistema retorna o status code 400 e a mensagem 'Este email já está sendo usado'.

* **Cenário 40: POST Múltiplos logins com senha incorreta dinâmico**
    * **Test Step:** Criar um usuário dinâmico e tentar logar várias vezes com a senha errada.
    * **Expected Result:** Cada tentativa de login falha, retornando o status code 401 e a mensagem 'Email e/ou senha inválidos'.

* **Cenário 41: POST Login com credenciais inválidas dinâmico**
    * **Test Step:** Tentar realizar login com um email e senha que não existem no sistema.
    * **Expected Result:** O login falha, retornando o status code 401 e a mensagem 'Email e/ou senha inválidos'.

* **Cenário 46: GET Listar usuários dinâmico**
    * **Test Step:** Realizar uma requisição GET para o endpoint de usuários.
    * **Expected Result:** A requisição é bem-sucedida, retornando o status code 200 e uma lista de usuários.

* **Cenário 47: GET Obter usuário por ID válido dinâmico**
    * **Test Step:** Criar um usuário dinâmico e, em seguida, buscar por seu ID recém-criado.
    * **Expected Result:** O sistema encontra o usuário, retornando o status code 200 e os dados do usuário correspondente.

* **Cenário 48: GET Obter usuário por ID inválido dinâmico**
    * **Test Step:** Tentar buscar um usuário utilizando um ID inválido (formato incorreto).
    * **Expected Result:** A busca falha, retornando o status code 400 e a mensagem 'id deve ter exatamente 16 caracteres alfanuméricos'.

* **Cenário 52: PUT Atualizar usuario com email duplicado dinamico**
    * **Test Step:** Criar dois usuários dinâmicos e tentar atualizar o email do primeiro com o email do segundo.
    * **Expected Result:** A atualização falha, retornando o status code 400 e a mensagem 'Este email já está sendo usado'.

* **Cenário 54: DELETE Excluir usuário dinâmico**
    * **Test Step:** Criar um usuário, obter um token de administrador e excluir o usuário recém-criado.
    * **Expected Result:** O usuário é excluído com sucesso, retornando o status code 200 e a mensagem 'Registro excluído com sucesso'.

* **Cenario 01 banco de dados: Adicionar Novo Usuario ao Banco JSON**
    * **Test Step:** Adicionar um novo usuário ao banco de dados JSON e verificar se ele foi encontrado.
    * **Expected Result:** O usuário é adicionado e encontrado com sucesso no banco de dados.

* **Cenario 02 banco de dados: Contar Usuarios no Banco**
    * **Test Step:** Contar o número total de usuários no banco JSON.
    * **Expected Result:** A contagem de usuários é maior ou igual a 3.

* **Cenario 03 banco de dados: Validar Estrutura dos Bancos JSON**
    * **Test Step:** Validar a estrutura dos bancos de dados JSON de usuários, endpoints e status codes.
    * **Expected Result:** Todas as estruturas dos arquivos JSON são validadas com sucesso.

* **Cenario 04 banco de dados: Testar Busca de Usuario Inexistente**
    * **Test Step:** Tentar buscar um usuário por um email que não existe no banco.
    * **Expected Result:** Um erro é retornado, indicando que o usuário não foi encontrado.

* **Cenario 05 banco de dados: Adicionar e Remover Usuario Dinamicamente**
    * **Test Step:** Adicionar um usuário temporário, verificar se a contagem aumenta e depois remover, verificando se a contagem volta ao normal.
    * **Expected Result:** O usuário é adicionado e removido com sucesso, e a contagem de usuários é restaurada corretamente.

* **Cenario 06 banco de dados: Testar Todos os Usuarios do Banco Dinamicamente**
    * **Test Step:** Carregar todos os usuários do banco de dados e iterar sobre eles, validando se os campos necessários não estão vazios.
    * **Expected Result:** Todos os usuários são validados com sucesso, com seus campos obrigatórios preenchidos e no formato correto.

#### Cenários de Produtos

* **Cenário 07: POST Criar produto com dados estáticos**
    * **Test Step:** Fazer login como admin para obter um token e criar um novo produto com dados fixos.
    * **Expected Result:** O produto é criado com sucesso, retornando o status code 201 e a mensagem 'Cadastro realizado com sucesso'.

* **Cenário 08: POST Criar produto duplicado estático**
    * **Test Step:** Tentar criar um produto com um nome que já existe no sistema.
    * **Expected Result:** A criação do produto falha, retornando o status code 400 e a mensagem 'Já existe produto com esse nome'.

* **Cenário 09: POST Criar produto com preço negativo estático**
    * **Test Step:** Tentar criar um produto com o campo 'preco' com um valor negativo.
    * **Expected Result:** A criação do produto falha, retornando o status code 400 e a mensagem de erro no campo 'preco'.

* **Cenário 10: POST Criar produto com quantidade negativa estático**
    * **Test Step:** Tentar criar um produto com o campo 'quantidade' com um valor negativo.
    * **Expected Result:** A criação do produto falha, retornando o status code 400 e a mensagem de erro no campo 'quantidade'.

* **Cenário 11: POST Criar produto sem token estático**
    * **Test Step:** Tentar criar um produto sem incluir o token de autorização.
    * **Expected Result:** A requisição falha, retornando o status code 401 e a mensagem 'Token de acesso ausente, inválido, expirado ou usuário do token não existe mais'.

* **Cenário 16: GET Listar produtos estático**
    * **Test Step:** Realizar uma requisição GET para o endpoint de produtos.
    * **Expected Result:** A requisição é bem-sucedida, retornando o status code 200 e a lista de produtos.

* **Cenário 17: GET Obter produto por ID válido estático**
    * **Test Step:** Criar um produto e buscar por seu ID para validar o retorno dos dados.
    * **Expected Result:** A requisição é bem-sucedida, retornando o status code 200 e os dados do produto correspondente.

* **Cenário 18: GET Obter produto por ID inválido estático**
    * **Test Step:** Tentar buscar um produto utilizando um ID que não tem o formato alfanumérico correto.
    * **Expected Result:** A requisição falha, retornando o status code 400 e a mensagem 'id deve ter exatamente 16 caracteres alfanuméricos'.

* **Cenário 21: GET Produto com ID não encontrado estático**
    * **Test Step:** Tentar buscar um produto com um ID válido, mas que não está no banco de dados.
    * **Expected Result:** A busca falha, retornando o status code 400 e a mensagem 'id deve ter exatamente 16 caracteres alfanuméricos'.

* **Cenário 23: PUT Atualizar produto estático**
    * **Test Step:** Criar um produto e atualizá-lo com novos dados estáticos.
    * **Expected Result:** A atualização é bem-sucedida, retornando o status code 200 e a mensagem 'Registro alterado com sucesso'.

* **Cenário 24: PUT Atualizar produto sem alterar dados estático**
    * **Test Step:** Criar um produto e realizar uma requisição PUT com os mesmos dados originais.
    * **Expected Result:** A requisição é bem-sucedida, retornando o status code 200 e a mensagem 'Registro alterado com sucesso'.

* **Cenário 25: PUT Atualizar produto com preco negativo estatico**
    * **Test Step:** Criar um produto e tentar atualizá-lo com um valor de preço negativo.
    * **Expected Result:** A atualização falha, retornando o status code 400 e a mensagem de erro no campo 'preco'.

* **Cenário 26: PUT Atualizar produto com quantidade negativa estatico**
    * **Test Step:** Criar um produto e tentar atualizá-lo com um valor de quantidade negativo.
    * **Expected Result:** A atualização falha, retornando o status code 400 e a mensagem de erro no campo 'quantidade'.

* **Cenário 27: PUT Atualizar produto sem token estatico**
    * **Test Step:** Tentar atualizar um produto sem incluir o token de autorização.
    * **Expected Result:** A requisição falha, retornando o status code 401 e a mensagem 'Token de acesso ausente, inválido, expirado ou usuário do token não existe mais'.

* **Cenário 29: PUT Atualizar produto com nome duplicado estatico**
    * **Test Step:** Tentar atualizar o nome de um produto para um nome já existente no sistema.
    * **Expected Result:** A atualização falha, retornando o status code 400 e a mensagem 'Já existe produto com esse nome'.

* **Cenário 30: DELETE Excluir produto estático**
    * **Test Step:** Criar um produto e excluí-lo usando o seu ID e um token de administrador.
    * **Expected Result:** O produto é excluído com sucesso, retornando o status code 200 e a mensagem 'Registro excluído com sucesso'.

* **Cenário 34: DELETE Excluir produto com ID de usuário estático**
    * **Test Step:** Tentar excluir um produto com o ID de um usuário, usando o token de um administrador.
    * **Expected Result:** A exclusão falha, retornando o status code 403 e a mensagem 'Rota exclusiva para administradores'.

* **Cenário 37: POST Criar produto com token de administrador**
    * **Test Step:** Criar um usuário administrador, logar para obter um token e criar um produto com dados dinâmicos usando o token.
    * **Expected Result:** O produto é criado com sucesso, retornando o status code 201 e a mensagem 'Cadastro realizado com sucesso'.

* **Cenário 42: POST Registro com nome de produto duplicado dinâmico**
    * **Test Step:** Criar um produto dinamicamente e tentar criar um segundo produto com o mesmo nome.
    * **Expected Result:** O sistema retorna o status code 400 e a mensagem 'Já existe produto com esse nome'.

* **Cenário 43: POST Registro com preço negativos dinâmico**
    * **Test Step:** Tentar criar um produto com o campo 'preco' com um valor negativo.
    * **Expected Result:** O sistema retorna o status code 400 e a mensagem 'preco deve ser um número positivo'.

* **Cenário 44: POST Registro com quantidade negativa dinâmico**
    * **Test Step:** Tentar criar um produto com o campo 'quantidade' com um valor negativo.
    * **Expected Result:** O sistema retorna o status code 400 e a mensagem 'quantidade deve ser maior ou igual a 0'.

* **Cenário 45: POST Acesso a rota protegida sem token dinâmico**
    * **Test Step:** Tentar criar um produto sem fornecer um token de autenticação.
    * **Expected Result:** O sistema retorna o status code 401 e a mensagem 'Token de acesso ausente, inválido, expirado ou usuário do token não existe mais'.

* **Cenário 49: PUT Atualizar produto com preco negativo dinâmico**
    * **Test Step:** Criar um produto e tentar atualizá-lo com um valor de preço negativo.
    * **Expected Result:** A atualização falha, retornando o status code 400 e a mensagem 'preco deve ser um número positivo'.

* **Cenário 50: PUT Atualizar produto com quantidade negativa dinâmico**
    * **Test Step:** Criar um produto e tentar atualizá-lo com um valor de quantidade negativo.
    * **Expected Result:** A atualização falha, retornando o status code 400 e a mensagem 'quantidade deve ser maior ou igual a 0'.

* **Cenário 51: PUT Atualizar produto sem token dinamico**
    * **Test Step:** Criar um produto e tentar atualizá-lo sem fornecer um token.
    * **Expected Result:** A atualização falha, retornando o status code 401 e a mensagem 'Token de acesso ausente, inválido, expirado ou usuário do token não existe mais'.

* **Cenário 53: PUT Atualizar produto com nome duplicado dinâmico**
    * **Test Step:** Criar dois produtos dinâmicos e tentar atualizar o nome do segundo com o nome do primeiro.
    * **Expected Result:** A atualização falha, retornando o status code 400 e a mensagem 'Já existe produto com esse nome'.

* **Cenário 55: DELETE Excluir produto dinâmico**
    * **Test Step:** Criar um produto, obter um token de administrador e excluir o produto recém-criado.
    * **Expected Result:** O produto é excluído com sucesso, retornando o status code 200 e a mensagem 'Registro excluído com sucesso'.

#### Cenários de Carrinhos

* **Cenário 12: POST Criar carrinho com dados estáticos**
    * **Test Step:** Criar um usuário, um produto, fazer login para obter um token e criar um carrinho com o produto.
    * **Expected Result:** O carrinho é criado com sucesso, retornando o status code 201 e a mensagem 'Cadastro realizado com sucesso'.

* **Cenário 19: GET Listar carrinhos estático**
    * **Test Step:** Realizar uma requisição GET para o endpoint de carrinhos.
    * **Expected Result:** A requisição é bem-sucedida, retornando o status code 200 e a lista de carrinhos.

* **Cenário 31: DELETE Cancelar compra do carrinho estático**
    * **Test Step:** Criar um carrinho com um produto e depois cancelar a compra.
    * **Expected Result:** A compra é cancelada com sucesso, o carrinho é removido e o estoque do produto é reabastecido.

* **Cenário 32: DELETE Concluir compra do carrinho estático**
    * **Test Step:** Criar um carrinho com um produto e depois concluir a compra.
    * **Expected Result:** A compra é concluída com sucesso, retornando o status code 200 e a mensagem 'Registro excluído com sucesso'.

* **Cenário 38: POST Adicionar e Criar carrinho completo dinâmico**
    * **Test Step:** Criar um usuário admin, um produto dinâmico e depois criar um carrinho com esse produto.
    * **Expected Result:** O carrinho é criado com sucesso, retornando o status code 201 e a mensagem 'Cadastro realizado com sucesso'.

* **Cenário 56: DELETE Concluir compra do carrinho dinâmico**
    * **Test Step:** Criar um usuário admin, criar um produto, adicionar ao carrinho e concluir a compra.
    * **Expected Result:** A compra é concluída com sucesso, retornando o status code 200 e a mensagem 'Registro excluído com sucesso'.

* **Cenário 57: DELETE Cancelar compra do carrinho dinâmico**
    * **Test Step:** Criar um usuário admin, criar um produto, adicionar ao carrinho e cancelar a compra.
    * **Expected Result:** A compra é cancelada com sucesso, retornando o status code 200 e a mensagem 'Registro excluído com sucesso. Estoque dos produtos reabastecido'.

### **🐛 Principais Achados & Oportunidades**

Durante a fase de execução, encontrei problemas críticos que afetam a estabilidade e a usabilidade do sistema:

* **Inconsistência na API:** A API retorna **`200 OK`** para tentativas de exclusão de registros que não existem. O retorno esperado seria `404 Not Found`. Além disso, a busca por ID inválido retorna um erro `400 Bad Request` em vez de `404 Not Found`.
* **Funcionalidades Ausentes:** Detectei a falta de funcionalidades básicas de **edição e exclusão de usuários**, e de remoção de itens individuais do carrinho no front-end.
* **Bugs Críticos de Lógica de Negócio:** Encontrei problemas na **lógica de negócio**, como a possibilidade de adicionar produtos ao carrinho mesmo com estoque zero.

---

### **✅ Conclusão**
Este projeto foi desenvolvido com o objetivo de exercitar boas práticas em **automação de testes de API** utilizando o **Robot Framework**.  
Através da integração com a **Serve  Rest**, foi possível validar diferentes **verbos HTTP**, explorar cenários **positivos e negativos**, além de garantir **organização e manutenibilidade** do código com o uso de ***keywords reutilizáveis**.
Este projeto, embora um desafio individual, serviu como uma demonstração prática e robusta de um ciclo de vida de QA bem-sucedido. Ao aplicar metodologias como a **QAlity** e construir uma automação modular com o **Robot Framework**, pude ir além da mera execução de testes.
O resultado é uma solução de teste completa, que não apenas validou os fluxos da API, mas também revelou **bugs críticos de lógica de negócio e inconsistências na API**, fornecendo um mapeamento claro dos riscos. Este trabalho comprova a minha capacidade de planejar, executar e documentar testes de forma estratégica, entregando um valor inestimável para a garantia da qualidade do produto.

---

### **🔗 Coleções Postman & Documentação**

* **Coleção Postman:** Todos os cenários de teste criados por mim estão em uma Collection Postman.
    * [**Acesse a Coleção aqui**](https://www.postman.com/mayconcontacts-3320949/workspace/petstore/collection/47360961-575e2e08-d764-4de6-9f19-e1223d3e3378?action=share&source=copy-link&creator=47360961)
    * [**Acesse a Documentação completa aqui**](https://andressamota.atlassian.net/wiki/x/AoASAQ).
 
👨‍💻 Desenvolvido por: **Maycon Douglas da Silva**  
📧 Contato: [mayconcontacts@gmail.com]  
🌐 GitHub: [https://github.com/MayconXis]
 