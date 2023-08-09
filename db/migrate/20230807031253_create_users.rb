class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :eamil
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.boolean :isAdmin, default: false
      t.text :stripe_id

      t.timestamps
    end
  end
end