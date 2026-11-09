require 'digest'
require 'securerandom'

class User < ApplicationRecord
  has_many :cats, dependent: :nullify

  # Virtuális mezőként elérhetővé tesszük a jelszót a formokhoz
  attr_accessor :password, :password_confirmation

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, if: :password_required?

  before_save :encrypt_password

  def password_required?
    self.new_record? || self.password.present?
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass.to_s + salt.to_s)
  end

  def encrypt_password
    return if password.blank?
    if self.new_record?
      self.salt = SecureRandom.hex(8)
    end
    self.encrypted_password = User.encrypt(self.password, self.salt)
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    if user.encrypted_password == User.encrypt(password, user.salt)
      user
    else
      nil
    end
  end
end