class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :icon, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/, size: { in: 0..5.megabytes }
  has_attached_file :app_landing_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :app_landing_image, content_type: /\Aimage\/.*\Z/, size: { in: 0..5.megabytes }

  validates :name, presence: {message: "Please enter Name"}
  validates :mobile_number,:presence => {message: "Please enter Mobile Number"}
  validates :mobile_number, :numericality => {message: "Please enter Number Format"}
  validates :app_landing_image ,presence: {message: "Please choose Image"}
  validates :icon ,presence: {message: "Please choose Icon"}
  validates :theme ,presence: {message: "Please select Theme"}
  validates :org_name ,presence: {message: "Please enter Oragnization Name"}
  validates :app_name ,presence: {message: "Please enter App Name"}
  validates :email, presence: {message: "Please enter Email"}
  validates :password, presence: {message: "Please enter New Password"}

  # validate :check_content_type_of_icon
  # validate :check_content_size_of_icon

  # def check_content_type_of_icon
  #   unless icon.blank?
  #     if !%w(image/jpeg image/bmp image/jpg image/png).include?(self.icon_content_type)
  #       errors.add :document, "Please upload document in image format"
  #     end
  #   end
  # end

  # def check_content_size_of_icon
  #   if icon_file_size.to_f > (5.megabytes).to_f
  #     errors.add :document, "Please upload a document less than 5MB"
  #   end
  # end
end
