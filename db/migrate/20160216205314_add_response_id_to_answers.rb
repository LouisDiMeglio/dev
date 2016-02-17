class AddResponseIdToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :response, index: true, foreign_key: true
  end
end
