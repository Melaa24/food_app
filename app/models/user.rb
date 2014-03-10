class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }
  validates :studio_id, presence: true
  validates :ayurveda_id, presence: true
  has_secure_password
  validates :password, length: { minimum: 6 }

  belongs_to :studio
  belongs_to :ayurveda
  accepts_nested_attributes_for :studio
  accepts_nested_attributes_for :ayurveda

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
