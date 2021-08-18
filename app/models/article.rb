class Article < ApplicationRecord
    has_many :article_sections
    has_many :sections, through: :article_sections
end
