class MembersController < ApplicationController
  
  def show
    @member = Member.find(current_member.id)
  end
  
  def edit
    @member = Member.find(current_member.id)
  end
end
