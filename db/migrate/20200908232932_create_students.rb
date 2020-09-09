class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :age
      t.string :contact_info
      t.boolean :check_in_status
      t.timestamps
    end
  end
end

