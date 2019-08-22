class CreateHumen < ActiveRecord::Migration[5.2]
  def change
    create_table :humen do |t|
      t.string :head
      t.string :body

      t.timestamps
    end
  end
end
