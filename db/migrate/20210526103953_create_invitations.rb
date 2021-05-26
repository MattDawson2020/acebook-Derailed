class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :friend_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
