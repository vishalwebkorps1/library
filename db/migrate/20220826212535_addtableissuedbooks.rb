class Addtableissuedbooks < ActiveRecord::Migration[7.0]
  def change 
    create_table :issuedbooks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false,foreign_key: true
      t.boolean "is_returned"
      t.datetime "return_dt"
      t.datetime "issued_on"
      t.float "fine"
      t.datetime "submittion"

      t.timestamps
    end
  end
end
