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