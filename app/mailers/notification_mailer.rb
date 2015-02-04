class NotificationMailer < ActionMailer::Base
  default from: "\"KGS Rastede - Abiturjahrgang 2015\" <hallo@abimorrow.net>"

  def new_vote(vote)
    @vote = vote
    mail(to: vote.user.email, subject: 'Berechtigung zur Teilnahme an einer Abstimmung')
  end
end