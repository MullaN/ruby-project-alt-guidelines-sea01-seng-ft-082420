class AddCheckInStatusToClassrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :classrooms, :check_in_status, :boolean
  end
end
