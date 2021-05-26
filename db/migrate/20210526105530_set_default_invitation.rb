class SetDefaultInvitation < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:invitations, :confirmed, :false)
  end
end
