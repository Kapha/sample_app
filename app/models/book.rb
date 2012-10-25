class Book < ActiveRecord::Base
  attr_accessible :author, :description, :rating, :title, :user_id
end
