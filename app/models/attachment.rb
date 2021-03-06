class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true

  has_attached_file :attachment, :url => Rails.application.config.action_controller.relative_url_root.to_s+"/system/attachments/:id/:style/:filename", :path => ":rails_root/public/system/attachments/:id/:style/:filename"
  do_not_validate_attachment_file_type :attachment
  validates_attachment_presence :attachment
  
  before_save :ensure_name
  
  def friendly_size
	  if (attachment.size / 1024) < 1024
      (attachment.size / 1024.0).ceil.to_s + " kB"
    else
      (attachment.size / 1048576.0).to_s[0..3] + " MB"
    end
  end
  
  private
    def ensure_name
      self.name = self.attachment.original_filename if self.name.blank?
    end
end
