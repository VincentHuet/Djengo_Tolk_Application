class AddEnValueToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :en_value, :string
  end
end
