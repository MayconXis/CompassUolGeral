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

👨‍💻 Desenvolvido por: **Maycon Douglas da Silva**  
📧 Contato: [mayconcontacts@gmail.com]  
🌐 GitHub: [https://github.com/MayconXis] 