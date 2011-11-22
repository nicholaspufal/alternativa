# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



exam1 = Exam.create([{
  title: 'Prova de inglês',
  questions: Question.create([
    { 
      title: 'My name _____ Robert.',
      answers: Answer.create([
          { title: 'are', correct: false },
          { title: 'called', correct: false },
          { title: 'is', correct: true },
          { title: 'says', correct: false }
        ])
    },
    { 
      title: 'He _______ 25 years old.',
      answers: Answer.create([
          { title: 'have', correct: false },
          { title: 'am', correct: false },
          { title: 'has', correct: true },
          { title: 'is', correct: false }
        ])
    },
    { 
      title: 'The time is 16:40. How would you normally say this?',
      answers: Answer.create([
          { title: 'seventeen less twenty', correct: false },
          { title: 'twenty to five', correct: false },
          { title: 'forty minutes past sixteen', correct: true },
          { title: 'forty minutes past four', correct: false }
        ])
    },
    { 
      title: 'On holiday, I like to sit ___the beach.',
      answers: Answer.create([
          { title: 'in', correct: false },
          { title: 'under', correct: false },
          { title: 'on', correct: true },
          { title: 'with', correct: false }
        ])
    },
    { 
      title: 'The woman ______lives next door is a vegetarian.',
      answers: Answer.create([
          { title: 'what', correct: false },
          { title: 'she', correct: false },
          { title: 'who', correct: true },
          { title: 'is', correct: false }
        ])
    },
    { 
      title: 'Phil and Sharon would like to ______their own house.',
      answers: Answer.create([
          { title: 'have', correct: true },
          { title: 'take', correct: false },
          { title: 'live', correct: false },
          { title: 'want', correct: false }
        ])
    },
    { 
      title: 'The author _____ a fantastic book.',
      answers: Answer.create([
          { title: 'written', correct: false },
          { title: 'wrote', correct: true },
          { title: 'write', correct: false },
          { title: 'right', correct: false }
        ])
    },
    { 
      title: 'Finishing a test is always ______.',
      answers: Answer.create([
          { title: 'satisfies', correct: false },
          { title: 'satisfaction', correct: false },
          { title: 'satisfied', correct: false },
          { title: 'satisfying', correct: true }
        ])
    }
  ])
}])


