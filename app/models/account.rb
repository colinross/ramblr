class Account < ActiveRecord::Base
  has_one :apitoken
  belongs_to :user
end
