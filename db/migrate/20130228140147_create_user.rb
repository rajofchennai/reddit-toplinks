class CreateUser < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.integer :id
      t.string  :email, :unique => true, :empty => false
    end
  end

  def down
    drop_table :users
  end
end
