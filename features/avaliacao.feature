# language: pt

Funcionalidade: Professor cria avaliação
	Como um professor
	Eu quero criar uma avaliação
	Para que eu possa disponibilizar uma prova pelo sistema

	Cenário: Professor acessa o formulário de cadastro de nova avaliação 
		Dado que eu estou na página das avaliações
		Quando eu clico "Criar nova avaliação"
		Então eu devo ver "Criar avaliação"

	@wip
	Cenário: Professor exclui uma das alternativas de uma questão
		Dado que eu estou na página de nova avaliação
		Quando eu clico "Remover"
		Então o campo deve sumir 
		
	Cenário: Professor preenche todos os campos corretamente e submete 
		Dado que eu estou na página de nova avaliação
		Quando eu preencho o seguinte:
	    | Título 				| Primeira avaliação |
	    | Questão #1		| Qual cor do cavalo branco de napoleão? |
	    | Alternativa			| Roxo |
	    | Alternativa			| Amarelo |
		  | Alternativa			| Verde |
			| Alternativa			| Branco |
		E eu aperto "Salvar"	
		Então eu devo ver "Título"
		E eu devo ver "Primeira avaliação"
	
	
	Cenário: Professor submete uma avaliação
		Dado que eu acessei o formulário de cadastro de nova avaliação
		E o preenchi corretamente #substituir pelos dados fornecidos ao formulário...
		Quando eu pressionar "Criar avaliação"
		Então eu devo ver "Avaliação X" #substituir pelo dado fornecido acima...
		
		