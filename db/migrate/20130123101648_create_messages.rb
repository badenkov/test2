class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :content
      t.references :user

      t.timestamps
    end
  end
end
