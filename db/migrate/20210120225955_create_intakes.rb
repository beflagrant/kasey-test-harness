class CreateIntakes < ActiveRecord::Migration[6.0]
  def change
    create_table :intakes do |t|
      t.string :name
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
