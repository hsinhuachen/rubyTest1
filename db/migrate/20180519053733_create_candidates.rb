class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :gender
      t.string :age
      t.string :party
      t.text :msg
      t.integer :vote

      t.timestamps
    end
  end
end
