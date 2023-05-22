require 'csv'
require 'time'

csv_contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

number_signed_on_day_of_week = {}

days_of_week = %i[sunday monday tuesday wednesday thursday friday saturday]
days_of_week.each do |day|
  number_signed_on_day_of_week[day] = 0
end

csv_contents.each do |row|
  date = row[:regdate]
  day_signed = Time.strptime(date, '%D %H:%M').wday
  number_signed_on_day_of_week[days_of_week[day_signed]] += 1
end

# I imagine a program that uses the hash and outputs a graph
# The graph shows the day and number of people that signed-up on that day of the week
