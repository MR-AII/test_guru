Category.create([{title: 'Backend'},
                 {title: 'frontend'},
                 {title: 'full-stack'}])

Test.create([{title: 'Ruby', level: 1, category_id: Category.first.id},
             {title: 'Ruby', level: 2, category_id: Category.first.id},
             {title: 'Ruby', level: 3, category_id: Category.second.id},
             {title: 'PHP', level: 3, category_id: Category.last.id},
             {title: 'PHP', level: 4, category_id: Category.last.id},
             {title: 'Java', level: 4, category_id: Category.third.id},
             {title: 'Java', level: 3},
             {title: 'Java', level: 5},
             {title: 'Python', level: 2}])

Question.create([{title: 'Переменные', body: 'где хранятся переменные?'},
                 {title: 'Инстанст класса', body: 'как создается инстанс класса?'},
                 {title: 'Массивы', body: 'Какой метод используется для определения размера массива?'}])

Answer.create([{title: 'В heap', correct: true},
               {title: 'В stack', correct: false},
               {title: 'на жестком диске', correct: false},
               {title: 'методом new', correct: true},
               {title: 'автоматически', correct: false },
               {title: 'size', correct: true},
               {title: 'first', correct: false}])

User.create(name: "Tom")