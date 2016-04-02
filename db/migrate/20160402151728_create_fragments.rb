class CreateFragments < ActiveRecord::Migration
  def change
    create_table :fragments do |t|
      t.integer :datatype
      t.string :value

      t.timestamps null: false
    end
  end
end
