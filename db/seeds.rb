# encoding: utf-8

group = Group.create(name: "Engenharia de Software - Manhã - SENAC")
  
Teacher.create([
    { name: "Professor Pardal", email: "profpardal@gmail.com", password: 123456, active: true }
  ])
  
student = Student.create(name: "Joaõzinho", email: "joaozinho@gmail.com", password: 123456, active: true)
student.groups << group
  
exam = Exam.create(title: 'Prova de inglês', start_time: Time.parse("2012-04-05 16:30"),
  end_time: Time.parse("2012-04-05 18:30"),
  questions: Question.create([
    { 
      title: 'My name _____ Robert.',
      weight: 1.5,
      answers: Answer.create([
          { title: 'are', correct: false },
          { title: 'called', correct: false },
          { title: 'is', correct: true },
          { title: 'says', correct: false }
        ])
    },
    { 
      title: 'He _______ 25 years old.',
      weight: 1.5,
      answers: Answer.create([
          { title: 'have', correct: false },
          { title: 'am', correct: false },
          { title: 'has', correct: true },
          { title: 'is', correct: false }
        ])
    },
    { 
      title: 'The time is 16:40. How would you normally say this?',
      weight: 1.5,
      answers: Answer.create([
          { title: 'seventeen less twenty', correct: false },
          { title: 'twenty to five', correct: false },
          { title: 'forty minutes past sixteen', correct: true },
          { title: 'forty minutes past four', correct: false }
        ])
    },
    { 
      title: 'On holiday, I like to sit ___the beach.',
      weight: 1.5,
      answers: Answer.create([
          { title: 'in', correct: false },
          { title: 'under', correct: false },
          { title: 'on', correct: true },
          { title: 'with', correct: false }
        ])
    },
    { 
      title: 'The woman ______lives next door is a vegetarian.',
      weight: 1.5,
      answers: Answer.create([
          { title: 'what', correct: false },
          { title: 'she', correct: false },
          { title: 'who', correct: true },
          { title: 'is', correct: false }
        ])
    },
    { 
      title: 'Phil and Sharon would like to ______their own house.',
      weight: 1.5,
      answers: Answer.create([
          { title: 'have', correct: true },
          { title: 'take', correct: false },
          { title: 'live', correct: false },
          { title: 'want', correct: false }
        ])
    },
    { 
      title: 'The author _____ a fantastic book.',
      weight: 1.5,
      answers: Answer.create([
          { title: 'written', correct: false },
          { title: 'wrote', correct: true },
          { title: 'write', correct: false },
          { title: 'right', correct: false }
        ])
    },
    { 
      title: 'Finishing a test is always ______.',
      weight: 1.5,
      answers: Answer.create([
          { title: 'satisfies', correct: false },
          { title: 'satisfaction', correct: false },
          { title: 'satisfied', correct: false },
          { title: 'satisfying', correct: true }
        ])
    }
  ])
)
exam.groups << group



