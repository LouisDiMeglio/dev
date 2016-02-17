class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.boolean :published
      t.string :posted_on

      t.timestamps null: false
    end
  end
end
