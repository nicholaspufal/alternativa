## ALTERNATIVA - Sistema EAD para gestão de provas objetivas

O que é
------

ALTERNATIVA é uma ferramenta de apoio para educadores melhor dirigirem o ensino (avaliações e aulas) à suas turmas, e também para alunos terem rápido acesso a avaliações e as suas respectivas notas. 

Todo o seu modelo de negócio é estruturado para a finalidade de geração de provas objetivas que usam métodos de avaliação quantitativos, o que elimina uma série de elementos desnecessários no processo.

Sobre
------

ALTERNATIVA foi o meu TCC, e resolvi torná-lo open source por não existirem tantas ferramentas gratuitas tratando bem desse assunto. Caso o projeto seja interessante para outras pessoas, contribuições são muito bem-vindas.

Foi desenvolvido utilizando-se BDD, e para tanto foram criados diversos testes de aceitação (Cucumber) e unitários (RSpec).  

Funcionalidades
------

* Agendamento de provas
*	Duração das provas
*	Pesos das questões
*	Bloqueios de acesso
*	Correção automática das provas
*	Cálculo das notas através de média ponderada
*	Visões pontuais (um aluno específico)
*	Visões abrangentes (grupos de alunos)

Configuração
------

Abaixo seguem os arquivos - com suas respectivas linhas - que precisam ser configurados para o correto funcionamento do sistema. 

#### config/environments/production.rb
		config.action_mailer.default_url_options = { :host => 'yourdomain.com' }

#### config/application.rb
		ActionMailer::Base.smtp_settings = {
		  :enable_starttls_auto => true,
		  :address => 'smtp.gmail.com',
		  :port => 587,
		  :domain => 'mail.google.com',  # mail.customdomain.com if you use google apps
		  :authentication => 'plain',
		  :user_name => 'username@provider.com',
		  :password => 'secret'
		}

#### config/config.yml
		app_email: email_sistema@provedor.com
		admin_email: email_professor@provedor.com

### Licença MIT

Copyright (c) 2012 Nicholas Pufal

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

