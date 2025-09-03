#  Pasta de Challenge-CompassUol-QA-API-ServeRest 
 Desafio de Qualidade: Plano de Testes e Análise Completa da API ServeRest pela Compass Uol

### **🚀 Sobre Este Projeto**

Este documento é o resultado de um **challenge de testes de software**, básico e individual, que desenvolvi para a Compass UOL. Meu objetivo foi aplicar conhecimentos de planejamento e execução de testes de API em uma aplicação real, a ServeRest, para afinar habilidades em garantir a qualidade de um produto.

### **📋 Meu Plano de Trabalho**

#### **1. Planejamento Estratégico**

Comecei meu trabalho com uma análise completa da aplicação. Identifiquei os **riscos mais críticos**, como falhas de autenticação e inconsistências na lógica de negócio, para direcionar meus esforços de teste. Em seguida, escolhi as técnicas que eu usaria para cobrir a maior parte do sistema, incluindo **Testes CRUD** para as funcionalidades básicas e **Testes de Lógica de Negócio** para garantir que as regras de negócio fossem respeitadas.

#### **2. Cenários e Priorização**

Eu mapeei os principais cenários de teste para as APIs de usuários, produtos e carrinhos. Para ter certeza de que eu estava focando no que realmente importava, criei uma **matriz de risco**. Com ela, eu classifiquei cada cenário por probabilidade e impacto, o que me permitiu priorizar a execução dos testes mais críticos.

#### **3. Execução e Descobertas**

Eu conduzi todos os testes individualmente, explorando a API e a interface web para encontrar problemas. O foco foi validar os fluxos principais e, ao mesmo tempo, documentar qualquer comportamento inesperado.

Durante essa fase, encontrei diversos bugs e oportunidades de melhoria que eu documentei no formato de issues de Jira, prontos para serem corrigidos.

### **📊 Meus Resultados**

Enquanto testava, descobri problemas que afetavam tanto a API quanto a usabilidade do site. Aqui estão os principais achados:

* **Bugs Críticos:** Encontrei problemas na **lógica de negócio**, como a possibilidade de adicionar produtos ao carrinho mesmo com estoque zero, o que é um erro grave.
* **Bugs de Usabilidade:** O **layout do site não é responsivo**, o que o torna inutilizável em celulares.
* **Inconsistências da API:** Percebi que a API retorna **status codes incorretos**, como `200 OK` para recursos que não existem, o que pode confundir outros desenvolvedores.
* **Funcionalidades Ausentes:** Detectei a falta de funcionalidades básicas de **edição e exclusão de usuários**, e de remoção de itens individuais do carrinho.

### **✅ Conclusão**

Apesar de ser um desafio pequeno e básico, este trabalho me permitiu aplicar, na prática, os conhecimentos de planejamento, execução e documentação de testes. Eu pude ter uma visão completa de um projeto de qualidade, desde o entendimento dos requisitos até a entrega final dos relatórios de bugs. O projeto foi um sucesso, e eu demonstrei a importância de um processo de QA bem estruturado para o desenvolvimento de qualquer produto.

---

### **🔗 Coleções Postman e Documentação**

* **Coleção Postman:** Todos os cenários de teste criados por mim estão em uma Collection Postman.
    
    [**Clique aqui para acessar a Coleção**](https://www.postman.com/mayconcontacts-3320949/workspace/petstore/collection/47360961-575e2e08-d764-4de6-9f19-e1223d3e3378?action=share&source=copy-link&creator=47360961)
    [**Clique aqui para acessar a Documentação**](https://www.postman.com/mayconcontacts-3320949/workspace/petstore/collection/47360961-575e2e08-d764-4de6-9f19-e1223d3e3378?action=share&source=copy-link&creator=47360961))

  # 📚 Documentação Geral de Estágio - Compass UOL 

 Nesta pasta, você encontrará documentos avulsos criados e utilizados durante o meu processo de estágio na Compass UOL. 
 Este material reflete as atividades e o conhecimento adquirido na área de Qualidade de Software (QA).

## Conteúdo

Os documentos aqui presentes incluem como:

* **Mapas Mentais:** Utilizados para planejar e visualizar o fluxo de teste de uma aplicação, como o mapa que detalha o fluxo de usuário do BugBank[cite: 752].
* **Fundamentos de Teste:** Materiais que abordam os princípios básicos e a necessidade dos testes, explicando a diferença entre teste e depuração, e os conceitos de erro, defeito e falha.
* **Planos de Teste:** Planos formais que detalham a estratégia, escopo e metodologia para testar diferentes projetos, como a verificação do Design de Interface do site do IFTO e o teste exploratório da aplicação BugBank
* **Metodologias e Heurísticas:** Documentos que explicam as metodologias de teste aplicadas, como os testes exploratórios baseados em heurísticas como CHIQUE, CRUD e ALTERFACE.
* Resultados e Análises:** Relatórios e documentação que mostram como os resultados dos testes são registrados e divulgados.

# Repositório do Projeto BugBank

Este repositório contém a documentação detalhada do projeto de teste e análise de qualidade para a aplicação BugBank. O trabalho foi realizado com o objetivo de aplicar metodologias de teste para identificar falhas, inconsistências e problemas de usabilidade, garantindo uma experiência de usuário mais robusta e intuitiva.

### 🚀 Sobre o Projeto

O projeto focou na aplicação de testes exploratórios guiados pela heurística **CHIQUE**. O objetivo principal foi identificar bugs e problemas de usabilidade no sistema BugBank, assegurando que as funcionalidades operassem como o esperado e proporcionassem uma experiência de usuário consistente e intuitiva[.

### **📋 Metodologia de Trabalho**

A abordagem de teste se baseou nas seguintes etapas:

#### **1. Planejamento e Análise**

* Foi criado um mapa mental com as principais telas da aplicação (Login, Cadastro, Dashboard e Transferência)].
* Neste mapa, foram listados os campos e os possíveis caminhos do usuário[.
* Outro mapa mental foi elaborado com cenários de testes funcionais e exploratórios baseados na heurística **CHIQUE**.A análise se concentrou em pontos como validação de campos obrigatórios, erros na transferência, mensagens do sistema, quebra de fluxo e usabilidade dos menus.

#### **2. Cenários de Teste e Priorização**

Foram definidos seis cenários de teste (CT-01 a CT-06) para avaliar diferentes aspectos do BugBank. A priorização foi baseada no impacto no usuário e na frequência de uso das funcionalidades, resultando em:

* **Prioridade Alta (P1):** Cenários que afetam diretamente a funcionalidade principal, como a quebra de fluxo na transferência (CT-04, CT-05), e falhas na navegação mobile (CT-02).
* **Prioridade Média (P2):** Bugs que causam inconveniência, mas não impedem o uso da funcionalidade, como problemas visuais no pop-up de sucesso (CT-01) e validações inconsistentes (CT-03).
* **Prioridade Baixa (P3):** Problemas menos críticos, como mensagens de erro técnicas que podem ser contornadas (CT-06).

### **📊 Principais Descobertas (Bugs)**

A execução dos testes exploratórios e cenários planejados resultou na identificação de vários bugs:

* **Bug 1 (CT-01):** Sobreposição incorreta do pop-up de confirmação de sucesso no modo mobile, afetando a usabilidade e consistência visual
* **Bug 2 (CT-02):** A seta de "voltar" na navegação mobile não funciona, exigindo que o usuário clique no texto ao lado, o que não é intuitivo.
* **Bug 3 (CT-03):** O sistema aceita alguns caracteres especiais, mas rejeita outros sem fornecer uma mensagem de erro clara, prejudicando a experiência do usuário.
* **Bug 4 (CT-04):** Ao tentar transferir para a própria conta, o sistema exibe o erro esperado, mas redireciona o usuário sem aviso, causando confusão.
* **Bug 5 (CT-05):** Após uma transferência bem-sucedida, o formulário não é limpo e não há redirecionamento para a tela de saldo, permitindo transferências acidentais.
* **Bug 6 (CT-06):** Mensagem de erro técnica e inconsistente ao tentar transferir valores inválidos, dificultando o entendimento e a correção por parte do usuário.

### **✅ Conclusão**

Este projeto demonstrou a importância de uma abordagem de QA estruturada para encontrar problemas que afetam a usabilidade e o fluxo do usuário. A documentação dos bugs e a matriz de risco forneceram um panorama claro do estado da aplicação, permitindo que a equipe de desenvolvimento priorize as correções de forma eficiente. O trabalho cobriu 100% das funcionalidades de Login, Cadastro, Dashboard e Transferência, tanto em ambiente web quanto mobile, e todos os critérios da heurística CHIQUE foram explorados.

# 📝 Repositório do Projeto PetStore

Este repositório contém os artefatos de teste de uma atividade que realizei para validar a API PetStore. Meu objetivo principal foi verificar a conformidade dos endpoints com a documentação do Swagger, garantindo a robustez, estabilidade e usabilidade da API. O projeto focou na aplicação de testes de especificação, usando o Postman para simular requisições e validar os retornos da API.

---

## 📋 Plano de Trabalho e Metodologia

### **1. Objetivo**

O principal objetivo foi verificar se a API PetStore atende aos contratos e cenários definidos na documentação do Swagger. Isso incluiu a validação das operações CRUD, dos fluxos de autenticação e da manipulação de dados. O foco foi identificar falhas de conformidade e comportamentos inesperados.

### **2. Ferramentas Utilizadas**

Para a realização dos testes, utilizei as seguintes ferramentas:
* **Swagger UI 3.x:** Para consultar a documentação da API de forma interativa e para exportar o arquivo JSON para referência.
* **Postman v10.9.0:** Para a criação e execução da Collection de testes. Configurei variáveis de ambiente (`baseUrl` e `apiKey`) e utilizei o `Collection Runner` para executar os testes em sequência.

### **3. Metodologia de Teste**

A estratégia adotada foi a de **Testes Baseados em Especificação**, que permite validar rigorosamente cada campo e comportamento esperado de acordo com a documentação. As heurísticas aplicadas incluíram:
* Verificação de códigos de status e mensagens de erro.
* Validação da consistência do esquema JSON retornado.
* Testes com dados inválidos e limites de input.
* Validação dos fluxos de autenticação por token.

---

### 🔬 Mapeamento de Endpoints e Resultados

O projeto foi dividido em três módulos principais: `Pets`, `Store` e `User`. Para cada módulo, foram mapeados endpoints e casos de teste, com registros dos resultados obtidos.

### **➡️ Pets (`/pet`)**
* **`POST /pet`:** Adiciona um novo pet. O teste deveria retornar o status `201 Created`, mas retornou `200 OK`.
* **`PUT /pet`:** Atualiza dados de um pet, com retorno `200 OK` e JSON atualizado.
* **`DELETE /pet/{petId}`:** Remove um pet, com retorno `200 OK` e mensagem de sucesso.
* **`GET /pet/findByStatus`:** Consulta pets por status. O retorno esperado é `200 OK` com um JSON contendo os dados.

### **➡️ Store (`/store`)**
* **`GET /store/inventory`:** Retorna a contagem de pets por status, com retorno esperado `200 OK`.
* **`POST /store/order`:** Cria um novo pedido. O teste deveria retornar o status `201 Created`, mas retornou `200 OK`.
* **`GET /store/order/{orderId}`:** Consulta um pedido por ID, com retorno `200 OK` se encontrado.
* **`DELETE /store/order/{orderId}`:** Cancela um pedido, com retorno esperado `200 OK`.

### **➡️ User (`/user`)**
* **`POST /user`:** Cria um novo usuário. O teste deveria retornar `201 Created`, mas retornou `200 OK`. Foi observado que este endpoint não estava cadastrando o usuário e retornou um erro 500 em um dos testes.
* **`GET /user/{username}`:** Consulta dados de um usuário por nome de usuário. O endpoint apresentou instabilidade, retornando erro `500 Internal Server Error` inicialmente, mas funcionou em um teste posterior.
* **`GET /user/login`:** Autentica um usuário. O teste mostrou que o endpoint aceita qualquer valor para `username` e `password`. Foi sugerido que a autenticação utilize `api-key` ou `token` para melhorar a segurança.
* **`GET /user/logout`:** Encerra a sessão do usuário. O retorno esperado é `200 OK` com a mensagem de logout.
* **`PUT /user/{username}`:** Atualiza os dados de um usuário, com retorno esperado `200 OK`.
* **`DELETE /user/{username}`:** Remove um usuário, com retorno esperado `200 OK`.

---

## ✅ Conclusão

Com a identificação de alguns bugs nos testes dos endpoints, podemos concluir que, embora a base funcional da API esteja em funcionamento, há pontos críticos que impedem a estabilidade e a confiabilidade da API em um ambiente de produção. A falha de segurança na autenticação do `GET /user/login` e a instabilidade em outros endpoints de usuário destacam a necessidade de melhorias na lógica e no servidor. O registro detalhado dos resultados e a sugestão de melhorias, como a adoção de autenticação mais robusta e a reparação da função de cadastro de usuário, mostram a importância de um processo de teste bem documentado para garantir a qualidade final do produto.


# 🧮 Pytest-TDD-Calculator

Este projeto demonstra a construção de uma **calculadora** usando **Desenvolvimento Orientado a Testes (TDD)** com a biblioteca **Pytest**. 
O objetivo é criar uma classe `Calculadora` e desenvolver suas funcionalidades de forma incremental,
garantindo que cada método seja coberto por testes unitários antes de sua implementação.

---

## 📝 Sobre o Projeto

A essência deste projeto é seguir a abordagem TDD:
1.  **Escrever o teste:** Criamos um teste que descreve o comportamento desejado para uma função, e ele, obviamente, falha.
2.  **Escrever o código:** Escrevemos o código mínimo necessário para fazer o teste passar.
3.  **Refatorar:** Melhoramos o código, se necessário, sem alterar seu comportamento.

A classe `Calculadora` irá incluir as quatro operações básicas (adição, subtração, multiplicação e divisão), 
além de duas operações adicionais de sua escolha. **Não foi permitido o uso da biblioteca `math`**.

---

## 🚀 Tecnologias Utilizadas

* **Python**: A linguagem de programação principal para a implementação da calculadora.
* **Pytest**: Framework de teste utilizado para criar e rodar testes para a calculadora em Python.
* **Git**: Sistema de controle de versão para gerenciar o projeto, com branches e commits diários.
* **GitHub Actions**: Ferramenta de CI/CD para automatizar o processo de testes.

## ⚙️ Instalação e Execução

Para configurar e executar o projeto segui estes passos.

### Pré-requisitos
* Python 3.8
* pip (instalador de pacotes Python)

### Rodando os Testes
Para verificar se as calculadoras estão funcionando corretamente.
* **Rodando os testes em Python:**
    ```
    pytest -m python
    ```

## 📚 Estrutura do Projeto

O projeto está organizado da seguinte forma para facilitar a navegação e a compreensão:

* `main/`: Contém o código-fonte principal da calculadora em Python (`calculadora.py`, e ademais calculadoras).
* `tests/`: Contém os arquivos de teste para a calculadora em Python (`test_paramDivisao.py`, `test_paramSoma.py`, `test_paramMultiplicacao.py`, `test_paramSubtracao.py`,`test_divisao.py`, `test_multiplicacao.py`,`test_soma.py`,`test_subtracao.py`,e ademais test para aprendizado).
* `calculadoratkinter.py`: Este arquivo é uma calculadora com interface gráfica construída com a biblioteca Tkinter. Ele também foi feito para aprendizado e não está relacionado ao projeto TDD principal.
* `calculadoraSimples.py`:Um script simples para aprendizado que realiza apenas uma soma, lendo a entrada do usuário. Conforme o seu comentário no código, ele não faz parte do projeto principal.
* `pytest.ini`: Arquivo de configuração do Pytest que define os caminhos dos testes e os marcadores.
* `requirements.txt`: Lista das dependências do projeto em Python.
* `README.md`: Este arquivo, que fornece uma visão geral do projeto.
* `Results/`: Prints de testes executados em dois cenário, correto e incorreto. 

## ✅ Requisitos do Projeto

O projeto atende aos seguintes critérios de avaliação:

* **Calculadora em Python**: A classe `Calculadora` possui métodos robustos para as 4 operações básicas, além de um tratamento de erro para divisão por zero.
* **Testes Python**: A calculadora conta com testes utilizando Pytest, incluindo o uso de fixtures, marcadores e parametrização.
* **Qualidade do Código**: O código não utiliza a biblioteca `math`, conforme o requisito do projeto.
* **Nomenclatura**: Os nomes das variáveis e métodos são claros e descritivos.
* **Plágio**: Todas as referências utilizadas para o desenvolvimento foram devidamente citadas neste `README.md`.

## 🤝 Autor e Referências

* **Autor**: Maycon Douglas da Silva
* **GitHub**: [https://github.com/MayconXis]

Este projeto foi construído com base nos seguintes materiais:

* **Calculadora Tkinter**: Curso no YouTube, usado para aprendizado. O curso foi acessado via [https://youtu.be/NhNORVxdOsc?si=lPFauxx0Q_HivIgB].
* **Calculadora Simples (Python)**: Curso "Linguagem de Programação PYTHON para Iniciantes" na Udemy, ministrado por Andre Iacono, utilizado para aprender os conceitos básicos de Python.
* **Pytest**: Curso de Pytest na Udemy, ministrado por Fernando Amaral, que guiou o aprendizado sobre testes automatizados, `fixtures`, testes parametrizados e marcadores.

  ---

  # 🚀 Automação de Testes de API - Robot Framework

## 📖 Visão Geral do Projeto
Este projeto foi desenvolvido como parte do **desafio técnico da Compass UOL**, com o objetivo de **aprofundar o conhecimento em automação de testes de API utilizando Robot Framework**.  

A automação foi construída utilizando o **Robot Framework**, que permite criar testes de aceitação e **TDD** .  

O foco principal está na **validação de requisições HTTP** e na interação com uma **API RESTful**. Para isso, foi utilizada a **[Reqres API](https://reqres.in/)** como ambiente de testes, possibilitando a exploração dos verbos HTTP:

- **GET**
- **POST**
- **PUT**
- **PATCH**
- **DELETE**

Além disso, foram incluídos cenários envolvendo **autenticação**, **validação de erros** e **respostas em diferentes contextos**.

---

## 🛠️ Requisitos e Tecnologias
- **Python 3.6+**
- **Robot Framework**
- Dependências listadas em `requirements.txt`

---
api-automation-reqres/
│

├── tests/
│ 

└── api_usuarios_test.robot       ---> Arquivo principal com os cenários de teste
│

├── resources/
│  
└── api_usuarios.resource      ---> Keywords dos cenários de teste   
│

├── requirements.txt          ---> Dependências do projeto

---

## ✅ Cobertura de Testes

### GET
- Listagem de usuários e recursos
- Obtenção de usuário por **ID válido**
- Obtenção de usuário por **ID inválido**
- Obtenção de resources (válido e inválido)
- Obtenção de **endpoints customizados**
- Consulta de status de assinatura **sem autorização**

### POST
- Criação de novos usuários
- Registro e login de usuários
- Logout de usuário
- Vincular e desvincular assinaturas
- Criação e execução de endpoints customizados

### PUT
- Atualização completa de usuário
- Atualização de resources
- Atualização de endpoints customizados
- Teste de atualização com **ID inválido**
- Execução de custom path sem autorização

### PATCH
- Atualização parcial de usuário
- Atualização parcial de resource
- Atualização de custom endpoints
- Teste de atualização com **ID inválido**
- Execução de custom path sem autorização

### DELETE
- Deleção de usuário
- Deleção de resource
- Deleção de custom endpoints
- Tentativa de deleção com **ID inválido**
- Tentativa de deleção sem autorização



## 🧾 Cenários de Teste Detalhados

### POST
1. Cenário 01 : POST Cadastrar um novo usuário com sucesso na ReqRes API
2. Cenário 02 : POST registrar um usuario
3. Cenário 03 : POST logar um usuario
4. Cenario 04 : POST Permitir usuario dar logout
5. Cenario 05 :POST Vincular Usuário a Assinatura Pro com Sucesso
6. Cenario 06 :POST Auto Vincular Usuário a Assinatura Pro com Sucesso
7. Cenario 07 :POST Desvincular Assinatura Pro de Usuário com Sucesso
8. Cenario 08 : POST Criar um Endpoint Customizado com Sucesso
9. Cenario 09 : POST Executar Endpoint Customizado em /custom/patch sem assinatura

### GET
10. Cenario 10: GET Listar usuarios com sucesso  
11. Cenario 11: GET Obter usuario com ID valido  
12. Cenario 12: GET Obter usuario com ID invalido  
13. Cenario 13: GET Listar resource  
14. Cenario 14: GET Obter resource por ID  
15. Cenario 15: GET Obter resource invalido  
16. Cenario 16: GET Obter Status de Assinatura sem autorização  
17. Cenario 17: GET Obter Custom Endpoints com sucesso  
18. Cenario 18: GET Obter Custom Endpoint por ID com sucesso  
19. Cenario 19: GET Obter Custom Endpoint com ID invalido  
20. Cenario 20: GET Executar Custom Path sem autorização  

### PUT
21. Cenario 21: PUT Atualizar usuario com sucesso  
22. Cenario 22: PUT Atualizar um resource com sucesso  
23. Cenario 23: PUT Atualizar Custom Endpoint com sucesso  
24. Cenario 24: PUT Executar Custom Path sem autorização  
25. Cenario 25: PUT Atualizar usuario com ID invalido 

### PATCH
26.Cenario 26: PATCH Atualizar parcialmente usuario com sucesso  
27. Cenario 27: PATCH Atualizar um resource com sucesso  
28. Cenario 28: PATCH Executar Custom Path sem autorização  
29. Cenario 29: PATCH Atualizar resource e ID invalido  

### DELETE
30. Cenario 30: DELETE Deletar usuario com sucesso  
31. Cenario 31: DELETE Deletar resource com sucesso  
34. Cenario 34: DELETE Deletar custom endpoint com sucesso  
35. Cenario 35: DELETE Deletar path sem autorização  
36. Cenario 36: DELETE Deletar usuario com ID invalido

---
# Sistema de Banco de Dados Dinâmico para Robot Framework

## Visão Geral
Este sistema implementa um banco de dados JSON dinâmico para testes automatizados com Robot Framework, permitindo:
- Gerenciamento centralizado de dados de teste  
- Testes data-driven  
- Manipulação dinâmica de dados JSON  
- Reutilização de dados entre diferentes cenários  

## Estrutura dos Arquivos

### Bancos de Dados JSON
- `data/banco_usuarios.json` - Dados de usuários, IDs e recursos  
- `data/banco_endpoints.json` - Dados de endpoints e payloads  
- `data/banco_status_codes.json` - Status codes esperados por operação  

### Resources
- `resources/banco_dados.resource` - Keywords para carregar dados dos bancos  
- `resources/manipular_json.resource` - Keywords para manipular dados JSON  
- `resources/api_usuarios.resource` - Keywords da API (modificado para usar dados dinâmicos)  

### Testes
- `tests/api_usuarios_test.robot` - Testes originais modificados  
- `tests/api_usuarios_dinamico_test.robot` - Testes data-driven  
- `tests/manipulacao_json_test.robot` - Testes de manipulação JSON  

## Como Usar

### 1. Carregar Dados do Banco
```robot
${usuario}=    Obter Usuario Valido    indice=0
${id_valido}=    Obter ID Valido    indice=1
${status_esperado}=    Obter Status Code Esperado    POST    criar_usuario
```
---

## 🏁 Conclusão
Este projeto foi desenvolvido com o objetivo de exercitar boas práticas em **automação de testes de API** utilizando o **Robot Framework**.  
Através da integração com a **Reqres API**, foi possível validar diferentes **verbos HTTP**, explorar cenários **positivos e negativos**, além de garantir **organização e manutenibilidade** do código com o uso de **keywords reutilizáveis**.  
O trabalho contribuiu para aprimorar minha experiência prática com **testes automatizados**, consolidando conhecimentos técnicos importantes e preparando terreno para desafios mais complexos em projetos futuros. 🚀  

---

👨‍💻 Desenvolvido por: **Maycon Douglas da Silva**  
📧 Contato: [mayconcontacts@gmail.com]  
🌐 GitHub: [https://github.com/MayconXis]  



