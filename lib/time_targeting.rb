require 'csv'
require 'time'

csv_contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

number_signed_on_hour = Hash.new(0)
csv_contents.each do |row|
  date = row[:regdate]
  hour_signed = Time.strptime(date, '%D %H:%M').hour
  number_signed_on_hour[hour_signed] += 1
end

# I imagine a program that uses the hash and outputs a graph
# The graph shows the hour and number of people that signed-up on that hour
