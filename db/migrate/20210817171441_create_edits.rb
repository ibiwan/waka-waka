class CreateEdits < ActiveRecord::Migration[6.1]
  def change
    create_table :edits do |t|
      t.references :user, null: false, foreign_key: true

      t.references :article, null: true, foreign_key: true
      t.references :section, null: true, foreign_key: true
      t.references :paragraph, null: true, foreign_key: true

      t.string :edit_type

      t.timestamps
    end
  end
end
