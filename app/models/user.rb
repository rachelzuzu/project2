require 'bcrypt'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :log
  
  # more devise stuff
  def in_role?(role)
      role == @role
  end

  def assign_role(role)
    @role = role
      
  end

end
