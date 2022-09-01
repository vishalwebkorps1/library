class Addtableissuedbooks < ActiveRecord::Migration[7.0]
  def change 
    create_table :issuedbooks do |t|
      t.integer "user_id"
      t.integer "book_id"
      t.boolean "is_returned"
      t.datetime "return_dt"
      t.datetime "issued_on"
      t.float "fine"
      t.datetime "submittion"

      t.timestamps
    end
  end
end
