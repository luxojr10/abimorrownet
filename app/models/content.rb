class Content < ActiveRecord::Base
  belongs_to :user
  has_many :content_associations

  has_attached_file :file
  do_not_validate_attachment_file_type :file
  validates_attachment_size :file, :less_than => 10.megabytes

  validates :title, :kind, presence: true
end
