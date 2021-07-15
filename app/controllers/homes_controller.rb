class HomesController < ApplicationController
  def top
  end
  
  def unsubscribe
    @member = Member.find(current_member.id)
  end
  
  def withdrawal
    @member = Member.find(current_member.id)
    @member.update(withdrawal_status: true)
    reset_session
    redirect_to root_path
  end
end
