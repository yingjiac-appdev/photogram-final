# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  comments_count  :integer
#  email           :string
#  likes_count     :integer
#  password_digest :string
#  private         :boolean
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many(:photos, { :class_name => "Photo", :foreign_key => "owner_id", :dependent => :destroy })
  has_many(:likes, { :class_name => "Like", :foreign_key => "fan_id", :dependent => :destroy })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "author_id", :dependent => :destroy })
  has_many(:follow_requests, { :class_name => "Followrequest", :foreign_key => "recipient_id", :dependent => :destroy })
  has_many(:sending_requests, { :class_name => "Followrequest", :foreign_key => "sender_id", :dependent => :destroy })
  has_many(:senders, { :through => :follow_requests, :source => :sender })
  has_many(:recipients, { :through => :sending_requests, :source => :recipient })
  validates(:username, { :presence => true })
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
