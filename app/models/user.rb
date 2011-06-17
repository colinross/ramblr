class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :timeoutable and :omniauthable, :encryptable, :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_one :profile, :dependent => :destroy
  has_many :ApiTokens
  has_many :characters, :through => :ApiTokens

  before_validation(:on => :create) do
    #standardize email
      self.email.downcase! if attribute_present?("email")
  end
  
  
end
