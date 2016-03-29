class Entry < ActiveRecord::Base
  belongs_to :feed
  has_many :entry_authors
  has_many :entry_links
  has_many :entry_categories
  has_many :authors, through: :entry_authors
  has_many :links, through: :entry_links
  has_many :categories, through: :entry_categories

  def enclosure_link
    links.detect { |link| link.rel == 'enclosure' }
  end

  def related_links
    links.find_all { |link| link.rel == 'related' }
  end
end
