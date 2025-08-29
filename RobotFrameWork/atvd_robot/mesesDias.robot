*** Variables ***
&{DIAS}    
...        janeiro=31
...        fevereiro=28
...        março=31
...        abril=30
...        maio=31
...        junho=30
...        julho=31
...        agosto=31
...        setembro=30
...        outubro=31
...        novembro=30
...        dezembro=31

*** Test Cases ***
Imprimir os dias dos meses do ano
    Log To Console     Mês 01: ${DIAS}[janeiro]
    Log To Console     Mês 02: ${DIAS}[fevereiro]
    Log To Console     Mês 03: ${DIAS}[março]
    Log To Console     Mês 04: ${DIAS}[abril]
    Log To Console     Mês 05: ${DIAS}[maio]
    Log To Console     Mês 06: ${DIAS}[junho]
    Log To Console     Mês 07: ${DIAS}[julho]
    Log To Console     Mês 08: ${DIAS}[agosto]
    Log To Console     Mês 09: ${DIAS}[setembro]
    Log To Console     Mês 10: ${DIAS}[outubro]
    Log To Console     Mês 11: ${DIAS}[novembro]
    Log To Console     Mês 12: ${DIAS}[dezembro]