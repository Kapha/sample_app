# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  author      :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Book < ActiveRecord::Base
  attr_accessible :author, :description, :title
  before_save { |book| book.title = title.upcase }

  validates :author, presence: true, length: { maximum: 50 }
  validates :title, presence: true, length: { maximum: 50 },
                    uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 250, minimum: 10 }
end
