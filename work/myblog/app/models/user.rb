class User < ActiveRecord::Base
  require 'action_view/helpers/text_helper'
  validates :name, :uniqueness => true, :presence => true
  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password
  #attr_accessor :birthday
  validate :birthday_must_be_time_format,:password_must_be_present,:salt_must_be_present
  #validate :password_must_be_present
  validates :head_photo, :allow_blank => true, :format => {
  :with => %r{\.(gif|jpg|png)\Z}i,
  :message => 'must be a URL for GIF, JPG or PNG image.'
  }
  validates_format_of :email, :message => "邮箱格式不正确!",
  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  #validate :salt_must_be_present

  def password=(password)
    @password =password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, self.salt)
    end
  end

  def get_user_birthday
    Time.now.year - self.birthday.year
  end

  def get_user_email_link
    auto_link_email_addresses self.email do
      "dddddddd"
    end
  end

  def show_sex_icon
    case self.sex.downcase
      when "male"
        "male_icon.jpg"
      when "female"
        "female_icon.jpg"
      else
        "sex_unknown.jpg"
    end
  end

  def User.authenticate(name, password)
    if user = User.find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def User.encrypt_password(password, salt)
    return Digest::SHA2.hexdigest(password+"besfan"+salt)
  end

  private

  def generate_salt
    self.salt= self.object_id.to_s + rand.to_s
  end

  def password_must_be_present
    errors.add(:password, "Password must not be blank!") unless hashed_password.present?
  end

  def salt_must_be_present
    errors.add(:salt, "Some thing wrong with Salt！ ") unless salt.present?
  end

  def birthday_must_be_time_format
    errors.add(:birthday, "Birthday must be a right time format！") unless birthday.present?
  end

end
