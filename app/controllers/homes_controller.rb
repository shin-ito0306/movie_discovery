class HomesController < ApplicationController
  def top
    movie_all = Tmdb::Movie.popular
    @movies = []
    (1..6).each do |i|
      @movies << movie_all.results[i]
    end
  end
  
  def about
    
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
