class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer "game_id"
      t.string "question_text"
      t.string "answer_one"
      t.string "answer_two"
      t.string "answer_three"
      t.string "answer_four"
      t.integer "correct_answer"

      t.timestamps
    end
  end
end
