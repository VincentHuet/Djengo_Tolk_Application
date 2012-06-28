class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.boolean :Primary_updated
      t.string :text
      t.string :previous_text
      t.integer :phrase_id
      t.string :phrase
      t.integer :locale_id
      t.string :locale

      t.timestamps
    end
  end
end
