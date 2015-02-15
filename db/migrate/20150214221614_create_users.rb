class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :username
      t.text :email
      t.text :firstName
      t.text :lastName
      t.text :password_digest
      t.text :currentBeer

      t.timestamps null: false
    end
  end
end
