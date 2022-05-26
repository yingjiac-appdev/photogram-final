# == Schema Information
#
# Table name: followrequests
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class Followrequest < ApplicationRecord
  belongs_to(:recipient, { :required => true, :class_name => "User", :foreign_key => "recipient_id" })
  belongs_to(:sender, { :required => true, :class_name => "User", :foreign_key => "sender_id" })
end
