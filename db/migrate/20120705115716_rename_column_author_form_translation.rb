class RenameColumnAuthorFormTranslation < ActiveRecord::Migration
  def up
    rename_column :translations, :author, :translator_id
  end

  def down
    rename_column :translations, :translator_id, :author
  end
end
