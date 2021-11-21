Test.create(title: 'Ruby', level: 1)
Test.create(title: 'PHP', level: 1)
Test.create(title: 'Java', level: 2)

Question.create(title: 'Переменные', body: 'где хранятся переменные?')
Question.create(title: 'Инстанст класса', body: 'как создается инстанс класса?')
Question.create(title: 'Массивы', body: 'Какой метод используется для определения размера массива?')

Answer.create(title: 'В heap', correct: true)
Answer.create(title: 'В stack', correct: false)
Answer.create(title: 'на жестком диске', correct: false )
Answer.create(title: 'методом new', correct: true)
Answer.create(title: 'автоматически', correct: false )
Answer.create(title: 'size', correct: true )
Answer.create(title: 'first', correct: false )

User.create(name: "Tom")

Category.create(title: 'Backend')
Category.create(title: 'frontend')
Category.create(title: 'full-stack')