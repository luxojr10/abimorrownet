class NotificationMailer < ActionMailer::Base
  default from: "\"KGS Rastede - Abiturjahrgang 2015\" <hallo@abimorrow.net>"

  def new_vote(vote)
    @vote = vote
    mail(to: vote.user.email, subject: 'Berechtigung zur Teilnahme an einer Abstimmung')
  end

  def nominated(nomination)
    @nomination = nomination
    mail(to: nomination.user.email, subject: 'Auszeichnung durch Abstimmung #{nomination.award.title}')
  end
end
