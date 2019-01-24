class AddCiviIdToStripedCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :striped_customers, :civi_id, :string
  end
end
