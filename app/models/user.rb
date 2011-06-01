class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :encryptable, :confirmable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_one :profile, :dependent => :destroy
  
  def standardize_email!
    self.email.lowercase!
  end
  
end
