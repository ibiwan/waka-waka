class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :heading
      t.boolean :is_text

      t.timestamps
    end
  end
end
