Category.create([{title: 'Backend'},
                 {title: 'frontend'},
                 {title: 'full-stack'}])

user = User.create({name: "Tom", email: 'tom@gmai.com'})
User.create({name: 'John', email: 'john@gmail.com'})

Test.create([{title: 'Ruby', level: 1, category_id: Category.first.id, user: user},
             {title: 'Ruby', level: 2, category_id: Category.first.id, user: user},
             {title: 'Ruby', level: 3, category_id: Category.second.id, user: user},
             {title: 'PHP', level: 3, category_id: Category.last.id, user: user},
             {title: 'PHP', level: 4, category_id: Category.last.id, user: user},
             {title: 'Java', level: 4, category_id: Category.third.id, user: user},
             {title: 'Java', level: 3, category_id: Category.third.id, user: user},
             {title: 'Java', level: 5, category_id: Category.third.id, user: user},
             {title: 'Python', level: 2, category_id: Category.third.id, user: user}])

Question.create([{title: 'Переменные', body: 'где хранятся переменные?', test: Test.first},
                 {title: 'Инстанст класса', body: 'как создается инстанс класса?', test: Test.second},
                 {title: 'Массивы', body: 'Какой метод используется для определения размера массива?', test: Test.third}])

Answer.create([{title: 'В heap', correct: true, question: Question.first},
               {title: 'В stack', correct: false, question: Question.second},
               {title: 'на жестком диске', correct: false, question: Question.third},
               {title: 'методом new', correct: true, question: Question.fourth},
               {title: 'автоматически', correct: false, question: Question.last },
               {title: 'size', correct: true, question: Question.last},
               {title: 'first', correct: false, question: Question.first}])