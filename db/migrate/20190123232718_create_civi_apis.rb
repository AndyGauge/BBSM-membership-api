class CreateCiviApis < ActiveRecord::Migration[6.0]
  def change
    create_table :civi_apis do |t|
      t.string :request
      t.string :response
      t.timestamps
    end
  end
end
