class Attachment < ActiveRecord::Base

  mount_uploader :file, AttachmentsUploader
  belongs_to :attachable, polymorphic: true

end
