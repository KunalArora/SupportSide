class AddCompanyIdToStaffs < ActiveRecord::Migration[5.0]
  def change
    add_column :staffs, :company_id, :string
  end
end
