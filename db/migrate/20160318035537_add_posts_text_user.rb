class AddPostsTextUser < ActiveRecord::Migration
  def change
    add_column :posts, :post_text, :text
    add_column :posts, :user_id, :integer
  end
end
