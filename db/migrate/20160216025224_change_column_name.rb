class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :responses, :question_id, :course_id
  end
end
