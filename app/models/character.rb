# == Schema Information
# Schema version: 20110310204743
#
# Table name: characters
#
#  id             :integer         not null, primary key
#  eveo_id        :integer
#  name           :string(255)
#  corporation    :integer
#  owning_user_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Character < ActiveRecord::Base
	attr_accessor :owning_user_id
end
