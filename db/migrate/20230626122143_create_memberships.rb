class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.belongs_to :gym
      t.belongs_to :client

      t.timestamps
    end
  end
end
