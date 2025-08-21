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
