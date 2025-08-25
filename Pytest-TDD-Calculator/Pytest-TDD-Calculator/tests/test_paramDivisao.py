import pytest
from main.calculadora import Calculadora

# Esses testes parametrizados para a função soma foram realizados para aprendizado com base no curso da udemy, 
# tendo o mesmo valor dos outros testes não parametizados

@pytest.mark.parametrize("a, b, resultado_esperado", [
    (10, 2, 5),         
    (10, 4, 2.5),      
    (7, 2, 3.5),       
    (-10, 2, -5),      
    (-10, -2, 5)        
])
@pytest.mark.divisaoParam
def test_divisao(a, b, resultado_esperado):
    calculadora = Calculadora()
    assert calculadora.divisao(a, b) == resultado_esperado

    