class CreateTranslators < ActiveRecord::Migration
  def change
    create_table :translators do |t|
      t.string :name
      t.integer :locale_id
      t.string :password

      t.timestamps
    end
  end
end
