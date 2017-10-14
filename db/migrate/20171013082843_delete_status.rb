class DeleteStatus < ActiveRecord::Migration[5.1]
  def change
    
    remove_column :lists, :status
  end
end

