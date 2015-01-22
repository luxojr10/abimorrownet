class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voting
  has_many  :voted_options, dependent: :destroy
  has_many :voting_options, through: :voted_options

  class << self
    def create_votes_for_all(voting, max_choices)
      User.all.each do |user|
        vote = self.new
        vote.user = user
        vote.voting = voting
        vote.max_choices = max_choices
        vote.uid = SecureRandom.base64(8)
        vote.save
      end
      return true
    end
  end
end
