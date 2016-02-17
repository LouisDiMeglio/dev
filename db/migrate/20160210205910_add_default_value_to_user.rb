class AddDefaultValueToUser < ActiveRecord::Migration
  def change
      change_column_default(:users, :type, "Student")
    end
end
