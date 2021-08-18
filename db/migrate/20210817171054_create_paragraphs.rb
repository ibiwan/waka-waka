class CreateParagraphs < ActiveRecord::Migration[6.1]
  def change
    create_table :paragraphs do |t|
      t.string :text

      t.timestamps
    end
  end
end
