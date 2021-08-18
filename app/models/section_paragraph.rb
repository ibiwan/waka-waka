class SectionParagraph < ApplicationRecord
  belongs_to :section
  belongs_to :paragraph
  belongs_to :edit
end
