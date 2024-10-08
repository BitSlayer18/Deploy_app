class User < ApplicationRecord
  before_save {email.downcase!}
  has_many :articles,dependent: :destroy
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username,presence: true,length: {minimum: 3,maximum: 25},uniqueness: {case_sensitive: false}
  validates :password,presence: true
  validates :email,presence: true,length: {maximum: 105},uniqueness: {case_sensitive: false},format: {with: VALID_EMAIL}
  has_secure_password
end
