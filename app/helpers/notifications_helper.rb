module NotificationsHelper
  def uncheck_notifications
    @notifications = current_member.active_notifications.where(check: false)
  end
end
