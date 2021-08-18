class CreateSectionSubsections < ActiveRecord::Migration[6.1]
  def change
    create_table :section_subsections do |t|
      t.references :parent_section, null: false, foreign_key: {to_table: :sections}
      t.references :sub_section, null: false, foreign_key: {to_table: :sections}
      t.references :edit, null: false, foreign_key: true
      t.integer :order_key

      t.timestamps
    end
  end
end
