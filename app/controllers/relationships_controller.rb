class RelationshipsController < ApplicationController
  
  def create
    a = current_member.relationships.create(followed_id: params[:id])
    byebug
    a.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    follower = current_member.relationships.find_by(followed_id: params[:id])
    follower.destroy
    redirect_back(fallback_location: root_path)
  end
end
