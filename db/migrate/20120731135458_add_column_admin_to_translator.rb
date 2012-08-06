class AddColumnAdminToTranslator < ActiveRecord::Migration
  def up
    add_column :translators, :admin, :boolean
  end

  def down
    remove_column :translators, :admin, :boolean
  end
end
