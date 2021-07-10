class RelationshipsController < ApplicationController
  
  def create
    current_member.relationships.create(followed_id: params[:member_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    follower = current_member.relationships.find_by(followed_id: params[:member_id])
    follower.destroy
    redirect_back(fallback_location: root_path)
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
