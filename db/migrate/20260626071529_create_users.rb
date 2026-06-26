class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest
      t.boolean :admin, default: false

      t.timestamps
    end

    # Enforce unique emails at the database level
    add_index :users, :email, unique: true
  end
end
