require "digest"

class AdminUser < ApplicationRecord
  begin
    require "bcrypt"
    bcrypt_available = true
  rescue LoadError
    bcrypt_available = false
  end

  if bcrypt_available
    has_secure_password
  else
    attr_reader :password

    validates :password_digest, presence: true

    def password=(new_password)
      @password = new_password
      self.password_digest = self.class.fallback_password_digest(new_password)
    end

    def authenticate(candidate_password)
      return false if password_digest.blank?

      expected_digest = self.class.fallback_password_digest(candidate_password)
      return self if ActiveSupport::SecurityUtils.secure_compare(password_digest, expected_digest)

      false
    rescue ArgumentError
      false
    end

    def self.fallback_password_digest(password)
      Digest::SHA256.hexdigest("wedding-admin::#{password}")
    end
  end

  validates :email, presence: true, uniqueness: true
end
