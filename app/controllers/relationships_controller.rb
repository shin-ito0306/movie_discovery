class RelationshipsController < ApplicationController
  
  def create
    @member_followed = Member.find(params[:member_id])
    current_member.relationships.create(followed_id: params[:member_id])
    @member_followed.create_notification_follow(current_member, @member_followed.id)
    
  end
  
  def destroy
    @member_followed = current_member.relationships.find_by(followed_id: params[:member_id])
    @member_followed.destroy
  end
  
  #呼び出し元がフォローしている側
  def follower
    member = Member.find(params[:member_id])
    @members = member.followed_members
  end
  
  #呼び出し元がフォローされている側
  def followed
    member = Member.find(params[:member_id])
    @members = member.follower_members
  end
end
