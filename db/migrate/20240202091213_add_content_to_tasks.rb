class AddContentToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :content, :string
  end
end
