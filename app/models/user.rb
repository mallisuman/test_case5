require 'digest/md5'

class User < ApplicationRecord
  # has_secure_password

  attr_accessor :password

  has_many :products, foreign_key: :uid

  before_create :set_password_digest

  def set_password_digest
  	 self.password_digest = Digest::MD5.hexdigest(Digest::MD5.hexdigest(password))
  end
end
