class CommitteeRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :committee
end
