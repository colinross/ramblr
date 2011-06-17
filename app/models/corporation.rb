# == Schema Information
# Schema version: 20110310204743
#
# Table name: corporations
#
#  id          :integer         not null, primary key
#  eveo_id     :integer
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Corporation < ActiveRecord::Base
	attr_accessible :eveo_id, :name, :description
end
