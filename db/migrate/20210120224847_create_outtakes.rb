class CreateOuttakes < ActiveRecord::Migration[6.0]
  def change
    create_table :outtakes do |t|
      t.string :full_name
      t.string :email, null:false
      t.decimal :n_decimal
      t.float :n_float
      t.integer :n_integer
      t.boolean :is_ok
      t.text :note
      t.date :birthday
      t.time :local_noon

      t.timestamps
    end
  end
end
