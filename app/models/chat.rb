class Chat < ActiveRecord::Base
  has_many :messages
  belongs_to :team
  has_and_belongs_to_many :users
end
