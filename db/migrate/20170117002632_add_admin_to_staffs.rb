class AddAdminToStaffs < ActiveRecord::Migration[5.0]
  def change
    add_column :staffs, :admin, :string
  end
end
