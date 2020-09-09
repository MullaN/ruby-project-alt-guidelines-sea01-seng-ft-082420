class AddMotdToClassrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :classrooms, :motd, :string
  end
end
