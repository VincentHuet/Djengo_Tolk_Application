class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :key

      t.timestamps
    end
  end
end
