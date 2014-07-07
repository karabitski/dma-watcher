class Account
  include ActiveModel::Model

  attr_accessor :id, :name, :country, :website
  validates_presence_of :website
end