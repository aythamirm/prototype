class HardWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly.minute_of_hour(0) }

  def perform
    collection_user = User.where('current_sign_in_at <= ?', 24.hours.ago).entries
    collecttion_user.each { |user| UserMailer.notification_email(user) }
  end
end