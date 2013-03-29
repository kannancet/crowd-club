class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :token_authenticatable, :confirmable, :lockable, :timeoutable 
         #:omniauthable
  has_many :location_histories
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, 
                  :password, 
                  :password_confirmation, 
                  :remember_me,
                  :first_name,
                  :last_name,
                  :confirmation_token, 
                  :confirmation_sent_at, 
                  :confirmation_status,
                  :confirmed_at,
                  :latitude, 
                  :longitude,
                  :address,
                  :current_location_id,
                  :last_sign_in_ip

  # attr_accessible :title, :body
end
