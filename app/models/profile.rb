class Profile < ActiveRecord::Base
  belongs_to :profileable, polymorphic: true
  belongs_to :user, class_name: "User", foreign_key: "profileable_id"
  has_many :comments
  has_many :quotes, as: :quotable

  validates :first_name, :last_name, presence: true

  delegate :group, :email, to: :user

  accepts_nested_attributes_for :user

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      [:first_name, :last_name]
    ]
  end

  def should_generate_new_friendly_id?
    first_name_changed? || last_name_changed?
  end

  def group_title
    self.user.group.title
  end

  def full_name
    self.user.first_name + " " + self.user.last_name
  end
end
