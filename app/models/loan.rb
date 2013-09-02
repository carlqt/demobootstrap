# == Schema Information
#
# Table name: loans
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  book_id     :integer
#  loan_date   :datetime
#  return_date :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class Loan < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
end
