# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  author      :string(255)
#  genre       :string(255)
#  no_of_items :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Book < ActiveRecord::Base
  
  validates :no_of_items, :numericality => { :greater_than_or_equal_to => 0 }, :presence => true
  validates :title, :author, :genre, :presence => true

  


end
