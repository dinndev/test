class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :transactions
  has_many :stocks, through: :transactions, dependent: :destroy
end