class Review < ActiveRecord::Base
  attr_accessible :book_id, :rating, :text, :user_id
end
