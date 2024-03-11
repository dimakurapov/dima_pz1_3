class User < ApplicationRecord
  rolify
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    has_many :markets
           
    validates :first_name, presence: true, length: { maximum: 100 }
    validates :last_name, presence: true, length: { maximum: 100 }
    validates :email, presence: true, length: { maximum: 150 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  end