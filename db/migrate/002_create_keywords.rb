require_relative '../../config/environment.rb'

class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
    	t.string :ancestry
      t.string :keyword
      t.string :region

      t.timestamps
    end
    add_index :keywords, :ancestry
    add_index :keywords, :keyword
  end
end