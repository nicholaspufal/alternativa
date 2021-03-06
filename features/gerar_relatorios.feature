# language: pt

Funcionalidade: Professor gera relatórios
	Como um professor
	Eu quero gerar relatórios
	Para que eu possa direcionar melhor o ensino aos meus alunos
	
Contexto: Estou logado como professor
	Dado que eu sou um professor e realizei login
	E que existem avaliações já respondidas por alunos

Cenário: Professor visualiza relatórios de um grupo
	Dado que eu acessei os relatórios de um grupo
	Então eu devo ver todas as avaliações daquele grupo listadas
	E eu devo ver a nota de cada aluno em cada uma das avaliações
	
Cenário: Professor visualiza relatórios de um aluno
	Dado que eu acessei os relatórios de um aluno
	Então eu devo ver todas as avaliações daquele aluno listadas
	E eu devo ver a nota de cada uma de suas avaliações