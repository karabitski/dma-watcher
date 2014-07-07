# link
# text
# technology
# date 
# account_name
# website
# account_id
# country


class Job < ActiveRecord::Base
	 self.table_name = "jobs"
	 belongs_to :account

end