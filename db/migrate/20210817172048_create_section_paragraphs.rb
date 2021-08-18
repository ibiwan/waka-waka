class CreateSectionParagraphs < ActiveRecord::Migration[6.1]
  def change
    create_table :section_paragraphs do |t|
      t.references :section, null: false, foreign_key: true
      t.references :paragraph, null: false, foreign_key: true
      t.references :edit, null: false, foreign_key: true
      t.integer :order_key

      t.timestamps
    end
  end
end
