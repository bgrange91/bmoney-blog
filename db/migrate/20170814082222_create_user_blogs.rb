class CreateUserBlogs < ActiveRecord::Migration
  def change
    create_table :user_blogs do |t|
    	t.integer :user_id
    	t.string :name
    	t.string :description
    	t.boolean :visible
      t.timestamps null: false
    end
  end
end
