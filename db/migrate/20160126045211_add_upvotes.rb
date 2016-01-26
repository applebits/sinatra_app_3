class AddUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :user_id
        t.string :song_id
        t.timestamps 
    end
  end
end