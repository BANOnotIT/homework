class CreateTimeEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :time_entries do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
