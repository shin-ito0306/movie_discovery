class MembersController < ApplicationController
  
  def show
    @member = Member.find(params[:id])
    @reviews = Review.where(member_id: params[:id])
  end
  
  def edit
    @member = Member.find(current_member.id)
  end
  
  def update
    @member = Member.find(current_member.id)
    if @member.update(member_params)
      redirect_to member_path(current_member.id)
    else
      render :edit
    end
  end
  
  
  private
  def member_params
    params.require(:member).permit(:name, :introduction, :member_image)
  end
end
