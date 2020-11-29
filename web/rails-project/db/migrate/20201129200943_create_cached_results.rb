class CreateCachedResults < ActiveRecord::Migration[6.0]
  def change
    create_table :cached_results do |t|
      t.integer :n
      t.string :result

      t.timestamps
    end
    add_index :cached_results, :n, unique: true
  end
end
