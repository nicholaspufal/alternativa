# language: pt

Funcionalidade: Aluno verifica seus resultados
	Como um aluno
	Eu quero verificar meus resultados
	Para que eu possa focar meus estudos onde eu realmente necessito 
	
Contexto: Estou logado como aluno
	Dado que eu sou o aluno "João", estou no grupo "Eng SW" e realizei login
	
Cenário: Nenhuma avaliação realizada
	Dado que não existe nenhuma avaliação realizada por mim
	Quando eu visitar a área de resultados
	Então eu devo ver uma mensagem de "Você ainda não realizou nenhuma avaliação"
	
Cenário: 2 provas realizadas
	Dado que a minha nota na avaliação "Introdução à Eng SW" foi "8.7"
	E que a minha nota na avaliação "Questões de projeto" foi "4.2"
	Quando eu visitar a área de resultados
	Então eu devo ver as notas "8.7" e "4.2" dentro do grupo "Eng SW"
	