class AddYamlPathToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :yaml_path, :string
  end
end
