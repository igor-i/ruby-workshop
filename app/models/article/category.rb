class Article::Category < ApplicationRecord
  has_many :article
end
