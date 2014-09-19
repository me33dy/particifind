class RemoveAgeFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :age, :integer
  	add_column :posts, :min_age, :integer
  	add_column :posts, :max_age, :integer
  	add_column :posts, :head, :string
  	add_column :posts, :location, :string
  	# add_column :posts, :phone, :string
  	# add_column :posts, :email, :string
  	add_column :posts, :website, :string
  	add_column :posts, :study_id, :string
  end
end
