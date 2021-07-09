class MembersController < ApplicationController
  
  def show
    @member = Member.find(current_member.id)
  end
  
  def edit
    @member = Member.find(current_member.id)
  end
  
  
  private
  def member_params
    params.require(:member).permit(:name, :introduction, :member_image)
  end
end
