class CreateDatafiles < ActiveRecord::Migration
  def change
    create_table :datafiles do |t|

      t.timestamps
    end
  end
end
