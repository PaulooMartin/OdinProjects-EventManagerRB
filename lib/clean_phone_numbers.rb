require 'csv'

def clean_phone_number(phonenum)
  phonenum.slice!(0) if phonenum.length == 11 && phonenum[0] == '1'
end

csv_contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

phonenumbers = {
  valid: [],
  invalid: []
}

csv_contents.each do |row|
  phonenum = row[:homephone].split(/[^0-9]/).join('')
  clean_phone_number(phonenum)
  if phonenum.length == 10
    phonenumbers[:valid].push(phonenum)
  else
    phonenumbers[:invalid].push(phonenum)
  end
end