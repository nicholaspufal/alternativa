# language: pt

Funcionalidade: Professor gerencia estudantes
	Como um professor
	Eu quero gerenciar meus alunos
	Para que eu possa distribuí-los conforme desejado
	
Contexto: Estou logado como professor
	Dado que eu sou um professor e realizei login
	
Cenário: Professor modifica os grupos de um aluno
	Dado que eu possuo um aluno cadastrado no grupo ABC
	E eu acessei a página de edição de um aluno
	E eu desmarquei todos os grupos deste aluno e salvei as alterações		
	Quando eu visitar novamente a página de edição do aluno
	Então eu devo ver todos os grupos desmarcados
	
Cenário: Professor libera o acesso de um aluno
	Dado que eu possuo o aluno "André" recém cadastrado
	Quando eu clicar para liberar o acesso de "André"
	Então eu devo ver o "André" desbloqueado

Cenário: Professor bloqueia o acesso de um aluno
	Dado que eu possuo o aluno "André" liberado
	Quando eu clicar para bloquear o acesso de "André"
	Então eu devo ver o "André" bloqueado
	