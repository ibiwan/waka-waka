class CreateArticleSections < ActiveRecord::Migration[6.1]
  def change
    create_table :article_sections do |t|
      t.references :article, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.references :edit, null: false, foreign_key: true
      t.integer :order_key

      t.timestamps
    end
  end
end
