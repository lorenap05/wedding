class Rsvp < ApplicationRecord
  validates :name, presence: true
  validates :attending, inclusion: { in: [true, false] }
end
