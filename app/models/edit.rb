class Edit < ApplicationRecord
  belongs_to :user

  belongs_to :article, optional: true
  belongs_to :section, optional: true
  belongs_to :paragraph, optional: true
end
