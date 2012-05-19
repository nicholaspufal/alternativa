# language: pt

Funcionalidade: Aluno responde avaliação
	Como um aluno
	Eu quero responder uma avaliação
	Para que eu possa garantir a minha nota 
	
Contexto: Estou logado como aluno
	Dado que eu sou o aluno "João", estou no grupo "Eng SW" e realizei login	
	E que existe a avaliação "Minha primeira prova" disponível ao grupo "Eng SW" em execução
	
Cenário: Aluno responde avaliação
	Dado que eu entrei na avaliação "Minha primeira prova"
	E que eu respondi toda ela de acordo com o meu conhecimento
	Quando eu clicar em "Finalizar avaliação"
	Então eu devo ver a minha nota
	
Cenário: Aluno gabarita uma avaliação
	Dado que eu entrei na avaliação "Minha primeira prova"
	E que eu respondi toda ela corretamente
	Quando eu clicar em "Finalizar avaliação"
	Então eu devo ver uma mensagem de parabéns
	
Cenário: Aluno visualiza as respostas para questões erradas
	Dado que eu entrei na avaliação "Minha primeira prova"
	E que eu errei a primeira e a última questão
	Quando eu clicar em "Finalizar avaliação"
	Então eu devo ver as respostas certas para a primeira e a última questões
	
Cenário: Aluno visualiza as questões corretas
	Dado que eu entrei na avaliação "Minha primeira prova"
	E que eu errei a primeira e a última questão
	Quando eu clicar em "Finalizar avaliação"
	Então eu devo ver a segunda e a terceira questões listadas como corretas
	
Cenário: Aluno submete a avaliação sem responder nenhuma questão
	Dado que eu entrei na avaliação "Minha primeira prova"
	E que eu não marquei nenhuma resposta
	Quando eu clicar em "Finalizar avaliação"
	Então eu devo ver uma mensagem informando que ao menos uma questão deve ser respondida
	
	