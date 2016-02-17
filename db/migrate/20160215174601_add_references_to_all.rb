class AddReferencesToAll < ActiveRecord::Migration
  def change
    add_reference :users, :course, index: true, foreign_key: true
    add_reference :quizzes, :course, index: true, foreign_key: true
    add_reference :quizzes, :user, index: true, foreign_key: true
  end
end
