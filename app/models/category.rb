class Category < ActiveRecord::Base
  has_many :entry_categories
end
