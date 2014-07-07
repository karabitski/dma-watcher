class Keyword < ActiveRecord::Base
	self.table_name = "keywords"
  has_ancestry
end