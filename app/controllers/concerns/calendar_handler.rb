module CalendarHandler
  extend ActiveSupport::Concern
  included do
  end

 def beginning_day_per_month(month)
   Date.new(month.year,month.month, month.beginning_of_month.day).beginning_of_week(:sunday)
 end
  
 def end_day_per_month(month)
   Date.new(month.year,month.month, month.end_of_month.day).end_of_week(:sunday)
 end
  
 def current_month(date)
  if date
    format_to_date(date)
  else
    Date.current
  end
 end
 
 private
 
 def format_to_date(date)
    splited_date = date.split("-").map { |b| b.to_i }
    Date.new(splited_date[0], splited_date[1], splited_date[2])
 end
 
end