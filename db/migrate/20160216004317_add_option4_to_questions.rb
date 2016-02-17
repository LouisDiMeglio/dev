class AddOption4ToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :option4, :string
  end
end
