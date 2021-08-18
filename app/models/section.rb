class Section < ApplicationRecord
    has_many :section_paragraphs
    has_many :paragraphs, through: :section_paragraphs

    has_many :section_subsections
    has_many :sub_sections, through: :section_subsections
end
