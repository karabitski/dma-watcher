require_relative '../../config/environment.rb'

class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.string :link
      t.text :text
      t.string :technology
      t.string :account_name
      t.string :website
      t.string :country
      t.integer :account_id
      t.datetime :date

      t.timestamps
    end
    add_index :jobs, :account_id
  end
end