# language: pt

Funcionalidade: Professor gerencia estudantes
	Como um professor
	Eu quero gerenciar um aluno específico
	Para que eu possa restringir o acesso dele apenas às avaliações que eu desejar
	
	Cenário: Professor cadastrada um aluno
		Dado que eu estou no formulário de cadastro de aluno
		E que eu preenchi todos os campos requeridos para um aluno
		Quando eu clico "Salvar"
		Então eu devo ver o novo aluno na listagem
		
	Cenário: Professor modifica os grupos de um aluno
		Dado que eu acessei a página de edição de um aluno
		E eu desmarquei todos os grupos do aluno e salvei as alterações		
		Quando eu visitar novamente a página de edição do aluno
		Então eu devo ver todos os grupos desmarcados