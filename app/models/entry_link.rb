class EntryLink < ActiveRecord::Base
  belongs_to :entry
  belongs_to :link
end
