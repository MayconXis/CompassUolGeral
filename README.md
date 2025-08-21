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
