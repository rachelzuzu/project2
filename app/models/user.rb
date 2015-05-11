require 'bcrypt'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :log
<<<<<<< HEAD
=======
  has_many :entries
  # has_one :entry
>>>>>>> c593921ae34f21e837f389c369bd5aa8f4f4a097
  
  # more devise stuff
  def in_role?(role)
      role == @role
  end

  def assign_role(role)
    @role = role
      
  end

end
