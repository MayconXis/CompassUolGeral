def is_positive (numero) :
    return numero > 0 
def teste_eh_positivo() :
        assert is_positive(5) is True
        assert is_positive(-5) is False
        
   #Este teste foi feito para aprendizado durante o curso de pytest da Udemy, não está relacionado ao calculadora