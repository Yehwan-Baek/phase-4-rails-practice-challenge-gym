class AddChargeToMemberships < ActiveRecord::Migration[6.1]
  def change
    add_column :memberships, :charge, :decimal
  end
end
