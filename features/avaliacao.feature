# language: pt

Funcionalidade: Professor cria avaliação
	Como um professor
	Eu quero criar uma avaliação
	Para que eu possa disponibilizar uma prova pelo sistema

	Cenário: Professor acessa o formulário de cadastro de nova avaliação 
		Dado que eu estou na página das avaliações
		Quando eu clico "Criar nova avaliação"
		Então eu devo ver "Criar avaliação"
		
	Cenário: Professor preenche e envia 
		Dado que eu estou na página de nova avaliação
		Quando eu preencho o seguinte:
	    | Nome da avaliação 		| Primeira avaliação |
	    | Pergunta							| Qual cor do cavalo branco de napoleão? |
	    | Alternativa						| Branco |
		E eu aperto "Salvar"	
		Então eu devo ver "Questão #1"
		E eu devo ver "Qual cor do cavalo branco de napoleão?"
		E eu devo ver "Alternativa #1"
		E eu devo ver "Branco"

	@javascript
	Cenário: Professor exclui uma das alternativas de uma questão
		Dado que eu estou na página de nova avaliação
		Quando eu clico "Remover"
		Então a alternativa deve sumir 
	
	@javascript
	Cenário: Professor exclui uma das questões de uma prova
		Dado que eu estou na página de nova avaliação
		Quando eu clico "remover questão"
		Então a questão deve sumir		
		
		#adicionar questao
		#adicionar alternativa