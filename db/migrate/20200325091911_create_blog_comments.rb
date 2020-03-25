class CreateBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_comments do |t|
      t.integer :user_id
      t.id :blog
      t.string :comments

      t.timestamps
    end
  end
end
