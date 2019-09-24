class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :question_text, :answer_one, :answer_two, :answer_three, :answer_four, :correct_answer
end
