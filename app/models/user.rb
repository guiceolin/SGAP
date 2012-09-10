class User < ActiveRecord::Base
  attr_accessible :email, :username, :name, :password, :password_confirmation
  attr_accessor :password
  attr_protected :crypted_password, :salt

  validates :password, confirmation: true, presence: { on: :create }
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true

  before_save :encrypt_password

  has_many :participations
  has_many :conversations, through: :participations

  def to_s
    name
  end

  def to_param
    username
  end

  def self.authenticate(email,password)
    user = find_by_email(email)
    if user && user.crypted_password == user.encrypt(password, user.salt)
      user
    else
      nil
    end
  end

  def encrypt(password, salt)
    BCrypt::Engine.hash_secret(password, salt)
  end

  private

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.crypted_password = encrypt(password, salt)
    end
  end

  def as_json(options={})
    super.merge({ label: name, value: to_param })
  end
end
