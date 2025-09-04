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

👨‍💻 Desenvolvido por: **Maycon Douglas da Silva**  
📧 Contato: [mayconcontacts@gmail.com]  
🌐 GitHub: [https://github.com/MayconXis] 