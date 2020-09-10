class AddStatusToClassrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :classrooms, :status, :boolean
  end
end
