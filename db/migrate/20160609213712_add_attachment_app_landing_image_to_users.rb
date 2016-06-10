class AddAttachmentAppLandingImageToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :app_landing_image
    end
  end

  def self.down
    remove_attachment :users, :app_landing_image
  end
end
