# language: pt

Funcionalidade: Professor gerencia grupos
	Como um professor
	Eu quero gerenciar grupos de alunos
	Para que eu possa gerar uma avaliação específica para cada grupo
	
Contexto: Estou logado como professor
	Dado que eu sou um professor e realizei login
	
Cenário: Professor cria um novo grupo
	Dado que eu estou no formulário de cadastro de grupo
	E que eu preenchi todos os campos requeridos para um grupo
	Quando eu clico "Salvar"
	Então eu devo ver o novo grupo na listagem