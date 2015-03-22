class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects

  def self.authenticate(email, password)
    user = User.find_for_authentication(:email => email)
    if user.present?
      user.valid_password?(password) ? user : nil
    else
      nil 
    end
  end
end
