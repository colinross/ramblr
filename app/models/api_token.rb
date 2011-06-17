# == Schema Information
# Schema version: 20110310204743
#
# Table name: api_tokens
#
#  id                  :integer         not null, primary key
#  eveo_user_id        :integer
#  eveo_api_key        :string(255)
#  token_scope         :string(255)
#  token_level         :string(255)
#  user_id             :integer
#  accessible_entities :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#
class ApiToken < ActiveRecord::Base
	belongs_to :user #default => current_user.id
	
	serialize :accessible_entities, ::Array
	
	validates_uniqueness_of :eveo_user_id
  # validate :validate_with_official_server	
  # Usage: Used as a validation method
  # To be nice to CCP and play within their guidelines, I validate the api_token with the server whenever it is :saved (read: changed)
	def validate_with_official_server
	  unless Aura::Api.token_is_valid?(self) 
  	    errors.add(:eve_api_key, "is invalid.")
	  end
	end
	  
	def after_validation_on_create
	  	if Aura::Api.token_is_full?(self)
	  	  self.token_scope = 'full'
		else
		  #we can assume its at least a valid limited key since this is called after validations, right?
		  self.token_scope = 'limited'
	  	end
	end



#regular methods
	def is_full? ; 	end
	def is_valid? ; end
	def update! ; end
	def accesses? ; end

end
