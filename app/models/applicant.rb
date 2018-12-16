class Applicant < ApplicationRecord
  validates :email, email: true, uniqueness: true
end
