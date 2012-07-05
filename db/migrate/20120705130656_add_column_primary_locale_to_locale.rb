class AddColumnPrimaryLocaleToLocale < ActiveRecord::Migration
  def up
    add_column :locales, :primary_locale, :boolean
  end
  
  def down
    remove_column :locales, :primary_locale, :boolean
  end
end
