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

## 🚀 Sobre o Projeto

[cite_start]O projeto focou na aplicação de testes exploratórios guiados pela heurística **CHIQUE**[cite: 1, 923]. [cite_start]O objetivo principal foi identificar bugs e problemas de usabilidade no sistema BugBank, assegurando que as funcionalidades operassem como o esperado e proporcionassem uma experiência de usuário consistente e intuitiva[cite: 925].

### **📋 Metodologia de Trabalho**

A abordagem de teste se baseou nas seguintes etapas:

#### **1. Planejamento e Análise**

* [cite_start]Foi criado um mapa mental com as principais telas da aplicação (Login, Cadastro, Dashboard e Transferência)[cite: 2, 948].
* [cite_start]Neste mapa, foram listados os campos e os possíveis caminhos do usuário[cite: 3, 650, 651, 652, 654].
* [cite_start]Outro mapa mental foi elaborado com cenários de testes funcionais e exploratórios baseados na heurística **CHIQUE**[cite: 4, 947]. [cite_start]A análise se concentrou em pontos como validação de campos obrigatórios, erros na transferência, mensagens do sistema, quebra de fluxo e usabilidade dos menus[cite: 5, 935, 936, 937, 938, 939, 940].

#### **2. Cenários de Teste e Priorização**

[cite_start]Foram definidos seis cenários de teste (CT-01 a CT-06) para avaliar diferentes aspectos do BugBank[cite: 952, 953]. [cite_start]A priorização foi baseada no impacto no usuário e na frequência de uso das funcionalidades[cite: 956], resultando em:

* [cite_start]**Prioridade Alta (P1):** Cenários que afetam diretamente a funcionalidade principal, como a quebra de fluxo na transferência (CT-04, CT-05), e falhas na navegação mobile (CT-02)[cite: 957, 958, 959].
* [cite_start]**Prioridade Média (P2):** Bugs que causam inconveniência, mas não impedem o uso da funcionalidade, como problemas visuais no pop-up de sucesso (CT-01) e validações inconsistentes (CT-03)[cite: 960, 961, 962].
* [cite_start]**Prioridade Baixa (P3):** Problemas menos críticos, como mensagens de erro técnicas que podem ser contornadas (CT-06)[cite: 963, 964].

### **📊 Principais Descobertas (Bugs)**

[cite_start]A execução dos testes exploratórios e cenários planejados resultou na identificação de vários bugs[cite: 969]:

* [cite_start]**Bug 1 (CT-01):** Sobreposição incorreta do pop-up de confirmação de sucesso no modo mobile, afetando a usabilidade e consistência visual[cite: 9, 10, 971, 972].
* [cite_start]**Bug 2 (CT-02):** A seta de "voltar" na navegação mobile não funciona, exigindo que o usuário clique no texto ao lado, o que não é intuitivo[cite: 12, 13, 975, 976, 977, 978].
* [cite_start]**Bug 3 (CT-03):** O sistema aceita alguns caracteres especiais, mas rejeita outros sem fornecer uma mensagem de erro clara, prejudicando a experiência do usuário[cite: 15, 979, 980, 981, 982, 983].
* [cite_start]**Bug 4 (CT-04):** Ao tentar transferir para a própria conta, o sistema exibe o erro esperado, mas redireciona o usuário sem aviso, causando confusão[cite: 16, 984, 985, 986, 987].
* [cite_start]**Bug 5 (CT-05):** Após uma transferência bem-sucedida, o formulário não é limpo e não há redirecionamento para a tela de saldo, permitindo transferências acidentais[cite: 17, 989, 990, 991, 992].
* [cite_start]**Bug 6 (CT-06):** Mensagem de erro técnica e inconsistente ao tentar transferir valores inválidos, dificultando o entendimento e a correção por parte do usuário[cite: 18, 994, 995, 996].

### **✅ Conclusão**

[cite_start]Este projeto demonstrou a importância de uma abordagem de QA estruturada para encontrar problemas que afetam a usabilidade e o fluxo do usuário[cite: 1]. [cite_start]A documentação dos bugs e a matriz de risco forneceram um panorama claro do estado da aplicação, permitindo que a equipe de desenvolvimento priorize as correções de forma eficiente[cite: 997, 998, 999]. [cite_start]O trabalho cobriu 100% das funcionalidades de Login, Cadastro, Dashboard e Transferência, tanto em ambiente web quanto mobile, e todos os critérios da heurística CHIQUE foram explorados[cite: 1004, 1005, 1006, 1007].
