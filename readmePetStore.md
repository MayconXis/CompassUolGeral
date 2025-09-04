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

👨‍💻 Desenvolvido por: **Maycon Douglas da Silva**  
📧 Contato: [mayconcontacts@gmail.com]  
🌐 GitHub: [https://github.com/MayconXis] 