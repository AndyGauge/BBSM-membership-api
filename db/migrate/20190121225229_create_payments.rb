class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.string :email
      t.string :token
      t.string :giving
      t.string :key
      t.string :street
      t.string :city
      t.string :province
      t.string :zip

      t.timestamps
    end
  end
end
