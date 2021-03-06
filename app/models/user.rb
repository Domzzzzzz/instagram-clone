class User < ActiveRecord::Base
  # Require username with signup & set max/min username length
  validates :username, presence: true, length: { minimum: 4, maximum: 16 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_attached_file :avatar, styles: { medium: '150x150#' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
