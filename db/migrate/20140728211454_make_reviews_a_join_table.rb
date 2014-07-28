class MakeReviewsAJoinTable < ActiveRecord::Migration
  def up
  	Review.delete_all
  	remove_column :users, :name
  	add_column :users, :user_id, :integer
  end

  def down
  	Review.delete_all
  	remove_column :users, :user_id
  	add_column :users, :name, :string
  end
end
