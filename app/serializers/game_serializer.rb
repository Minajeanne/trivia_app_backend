class GameSerializer
  include FastJsonapi::ObjectSerializer
  attribute :id

  attribute :questions do |game|
    game.questions.map do |question|
      {
        question_text: question.question_text,
        answer_one: question.answer_one,
        answer_two: question.answer_two,
        answer_three: question.answer_three,
        answer_four: question.answer_four,
        correct_answer: question.correct_answer
      }
    end
  end
end
