class CalendarController < ApplicationController
  def index
    @today = Date.new(2021, 8, 3)
    @first_day = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
    @end_day = Date.new(@today.year, @today.month, @today.end_of_month.day).end_of_week(:sunday)
    @calendar = @first_day.upto(@end_day)
    
    @member = Member.find_by(params[:member_id])
    
  end
end
