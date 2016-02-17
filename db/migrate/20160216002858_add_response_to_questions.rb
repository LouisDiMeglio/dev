class AddResponseToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :response, :string
  end
end
