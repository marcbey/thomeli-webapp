class BlacklistedEmail < ActiveRecord::Base
  validate :email, presence: true, uniqueness: true
end

