class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  has_many :likes

  has_many :comments

  has_one_attached :profile_pic

  has_many :follow_requests, -> { where(accepted: false) }, class_name: "Follow", foreign_key: "followed_id"
  has_many :accepted_recieved_requests, -> { where(accepted: true) }, class_name: "Follow", foreign_key: "followed_id"
  has_many :accepted_sent_requests, -> { where(accepted: true) }, class_name: "Follow", foreign_key: "follower_id"
  has_many :followers, through: :accepted_recieved_requests, source: :user
  has_many :followed, through: :accepted_sent_requests, source: :user


  # has_many :recieved_requests, class_name: "Follow", foreign_key: "followed_id"
  # has_many :send_requests, class_name: "Follow", foreign_key: "follower_id"


  # has_many :waiting_sent_requests, -> { where(accepted: false) }, class_name: "Follow", foreign_key: "follower_id"


end
