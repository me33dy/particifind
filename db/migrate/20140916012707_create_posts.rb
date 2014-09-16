class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :field
      t.date :begin_date
      t.date :end_date
      t.integer :participants_wanted
      t.integer :age
      t.string :gender
      t.string :description
      t.string :compensation
      t.float :time_needed

      t.timestamps
    end
  end
end
