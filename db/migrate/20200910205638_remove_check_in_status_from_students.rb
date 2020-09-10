class RemoveCheckInStatusFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :check_in_status, :boolean
  end
end
