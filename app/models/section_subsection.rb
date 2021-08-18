class SectionSubsection < ApplicationRecord
  belongs_to :parent_section, class_name: :Section
  belongs_to :sub_section, class_name: :Section
  belongs_to :edit
end
