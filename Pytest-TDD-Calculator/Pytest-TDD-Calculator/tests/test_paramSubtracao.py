import pytest
from main.calculadora import Calculadora

# Esses testes parametrizados para a função soma foram realizados para aprendizado com base no curso da udemy, 
# tendo o mesmo valor dos outros testes não parametizados

@pytest.mark.parametrize("a, b, resultado_esperado", [
    (10, 4, 6),     
    (5, 10, -5),       
    (0, 5, -5),        
    (-10, -5, -5)             
])

@pytest.mark.subtracaoParam
def test_subtracao(a, b, resultado_esperado):
    calculadora = Calculadora()
    assert calculadora.subtracao(a, b) == resultado_esperado