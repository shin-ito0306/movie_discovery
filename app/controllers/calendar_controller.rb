class CalendarController < ApplicationController
  def index
    if params[:day_front] != nil
      day = params[:day_front].split("-").map { |b| b.to_i }
      
      @today = Date.new(day[0], day[1], day[2])
    elsif params[:day_after] != nil
      day = params[:day_after].split("-").map { |b| b.to_i }
      
      @today = Date.new(day[0], day[1], day[2])
    else
      @today = Date.current
    end
    @first_day = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
    @end_day = Date.new(@today.year, @today.month, @today.end_of_month.day).end_of_week(:sunday)
    @calendar = [*@first_day..@end_day]
    @member = Member.find_by(params[:member_id])
  end
end
