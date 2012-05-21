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
	
Cenário: Professor seleciona alunos que compõe um grupo
	Dado que existem os alunos "Pedro", "Maria" e "César" cadastrados
	E que eu acessei o grupo "ABC"
	Quando eu selecionar "Pedro" e "Maria" e salvar
	E eu acessar novamente o grupo "ABC"
	Então eu devo ver "César" desmarcado
	E eu devo ver "Pedro" e "Maria" marcados
	