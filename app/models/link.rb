class Link < ActiveRecord::Base
  self.inheritance_column = :inheritance_type
end
