class NotificationsController < ApplicationController
  def index
    @notifications = current_member.passive_notifications.where(check: false)
    @notifications.each do |notification|
      notification.update_attributes(check: true)
    end
    byebug
  end
end
