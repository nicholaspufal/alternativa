# language: pt

Funcionalidade: Professor cria avaliações
	Como um professor
	Eu quero criar uma avaliação
	Para que eu possa disponibilizar uma prova pelo sistema
	
Contexto: Estou logado como professor
	Dado que eu sou um professor e realizei login	

@javascript
Cenário: Professor cria uma nova avaliação
	Dado que eu estou no formulário de cadastro para uma nova avaliação
	E que eu preenchi todos os campos requeridos para uma avaliação
	Quando eu clico "Salvar"
	Então eu devo ver os dados dessa nova avaliação
	
@javascript
Cenário: Professor exclui uma das alternativas de uma questão
	Dado que eu estou no formulário de cadastro para uma nova avaliação
	Quando eu clico "Remover"
	Então a alternativa deve sumir 

@javascript
Cenário: Professor exclui uma das questões da prova
	Dado que eu estou no formulário de cadastro para uma nova avaliação
	Quando eu clico "remover questão"
	Então a questão deve sumir		
	
@javascript
Cenário: Professor adiciona uma questão à prova
	Dado que eu estou no formulário de cadastro para uma nova avaliação
	Quando eu clico "Adicionar questão"
	Então uma nova questão deve aparecer
	
@javascript
Cenário: Professor adiciona uma alternativa à questão
	Dado que eu estou no formulário de cadastro para uma nova avaliação
	Quando eu clico "Adicionar alternativa"
	Então uma nova alternativa deve aparecer