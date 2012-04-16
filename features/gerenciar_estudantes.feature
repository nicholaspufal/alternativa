# language: pt

Funcionalidade: Professor gerencia estudantes
	Como um professor
	Eu quero gerenciar um aluno específico
	Para que eu possa restringir o acesso dele apenas às avaliações que eu desejar
	
Contexto: Estou logado como administrador
	Dado que eu sou um administrador e realizei login
	
Cenário: Professor modifica os grupos de um aluno
	Dado que eu possuo um aluno cadastrado no grupo ABC
	E eu acessei a página de edição de um aluno
	E eu desmarquei todos os grupos deste aluno e salvei as alterações		
	Quando eu visitar novamente a página de edição do aluno
	Então eu devo ver todos os grupos desmarcados