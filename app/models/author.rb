class Author < ActiveRecord::Base
  has_many :books

  validates :first_name, presence: true,
                         length: { minimum: 3 }
  validates :last_name, presence: true,
                         length: { minimum: 3 }
end
