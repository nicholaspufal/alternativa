# language: pt

Funcionalidade: Aluno responde avaliação
	Como um aluno
	Eu quero responder uma avaliação
	Para que eu possa garantir a minha nota 
	
Contexto: Estou logado como aluno
	Dado que eu sou um aluno e realizei login	
	E que existem avaliações em execução
	
Cenário: Aluno responde avaliação
	Dado que eu entrei em uma avaliação em execução
	E que eu respondi toda ela de acordo com o meu conhecimento
	Quando eu clicar em "Finalizar avaliação"
	Então eu devo ver a minha nota
	
Cenário: Aluno gabarita uma avaliação
	Dado que eu entrei em uma avaliação em execução
	E que eu respondi toda ela corretamente
	Quando eu clicar em "Finalizar avaliação"
	Então eu devo ver uma mensagem de parabéns
	E a minha nota deve ser 10