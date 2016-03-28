class Entry < ActiveRecord::Base
  belongs_to :feed
  has_many :entry_authors
  has_many :entry_links
  has_one :entry_category
  has_many :authors, through: :entry_authors
  has_many :links, through: :entry_links
  has_one :category, through: :entry_category
end
