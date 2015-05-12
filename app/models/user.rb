require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :logs
  # to grab entries through logs, so I can do user.entries
  has_many :entries, through: :logs

  
  # more devise stuff
  def in_role?(role)
      role == @role
  end

  def assign_role(role)
    @role = role
      
  end

end
