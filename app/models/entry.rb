class Entry < ActiveRecord::Base
  belongs_to :feed
  has_many :entry_authors
  has_many :entry_links
  has_one :entry_category
  has_many :authors, through: :entry_authors
  has_many :links, through: :entry_links
  has_one :category, through: :entry_category

  def enclosure_link
    links.detect { |link| link.rel == 'enclosure' }
  end

  def related_links
    links.find_all { |link| link.rel == 'related' }
  end
end
