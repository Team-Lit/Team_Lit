class Public < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :deliveries, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  has_many :orders, dependent: :destroy


  # validates :end_user_last_name, presence: true

  # validates :end_user_first_name, presence: true


  # validates :end_user_last_kana, presence: true


  # validates :end_user_first_kana, presence: true


  # validates :zip, presence: true


  # validates :address, presence: true


  # validates :end_user_phone, presence: true


  # def leave
  #   udpate_attribute(:leave_at, Time.current)

  #   new_email = self.leave_at.to_i.to_s + '_' + self.email.to_s
  #   self.skip_reconfirmation!
  #   update_attribute(:enail, new_email)

  #   social_profiles = self.social_profiles
  #   social_profiles.each do |sp|
  #     new_uid = self.leave_at.to_i.to_s + '_' + sp.uid.to_s
  #     sp.update_attribute(:uid, new_uid)
  #   end
  # end

  acts_as_paranoid


end
