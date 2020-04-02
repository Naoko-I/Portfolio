class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :following_id
      t.integer :followed_id

      t.references :following, foreign_key: { to_table: :users }
  	  t.references :followed, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
