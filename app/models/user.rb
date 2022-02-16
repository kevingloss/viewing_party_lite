# frozen_string_literal: true

class User < ApplicationRecord
  has_many :party_users
  has_many :parties, through: :party_users
  has_secure_password 
  validates_presence_of :password_digest

  validates_presence_of :name, :email
  validates :email, email: true, uniqueness: true

  def self.except_user(id)
    all.where.not(id: id)
  end
end
