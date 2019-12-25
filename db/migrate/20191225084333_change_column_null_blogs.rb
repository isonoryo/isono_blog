class ChangeColumnNullBlogs < ActiveRecord::Migration[5.2]
  def change
    change_column :blogs, :title, :string, null: false
    change_column :blogs, :content, :text, null: false
  end
end
