class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :choice
      t.references :user
      t.references :quiz
      t.references :question
    end
  end
end
