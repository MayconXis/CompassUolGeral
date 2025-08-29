*** Settings ***
Documentation  

*** Variables ***

@{LISTA}   1  2  3  4  5  6  7  8  9  10 

*** Test Cases ***
#caso de teste
Verificar Numeros Especificos 
    Percorrer Lista e Imprimir Numeros

*** Keywords ***
Percorrer Lista e Imprimir Numeros
    FOR    ${numero}    IN    @{LISTA}
        IF    '${numero}' == '5'
            Log To Console    Eu sou o numero 5!
        ELSE IF    '${numero}' == '10'
            Log To Console    Eu sou o numero 10!
        ELSE
            Log To Console    Eu nao sou o numero 5 e nem o 10!
        END
    END