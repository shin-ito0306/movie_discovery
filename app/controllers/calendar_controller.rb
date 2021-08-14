class CalendarController < ApplicationController
  include CalendarHandler
  
  def index
    @current_month = current_month(params[:date])
    beginning_day = beginning_day_per_month(@current_month)
    end_day = end_day_per_month(@current_month)
    @calendar = [*beginning_day..end_day]
    @member = Member.find_by(params[:member_id])
  end
  
end
