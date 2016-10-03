require "csv"
puts "EventManager Initialized!"

lines=File.readlines "event_attendees.csv" #done within the std lib using file keyword
row_index=0
lines.each do |line|
  row_index+=1
  next if row_index == 1
  columns=line.split(",")
  name=columns[2]
    puts name
  end

  puts "------------------------------------------------------------------"

contents=CSV.open "event_attendees.csv", headers: true, header_converters: :symbol #using external library CSV
contents.each do |row|
  name=row[:first_name]
  zipcode=row[:zipcode]
  # if the zip code is exactly five digits, assume that it is ok
    # if the zip code is more than 5 digits, truncate it to the first 5 digits
    # if the zip code is less than 5 digits, add zeros to the front until it becomes five digits
    if zipcode.nil?
      zipcode="00000"
    elsif zipcode.length < 5
      zipcode = zipcode.rjust 5, "0"
    elsif zipcode.length > 5
      zipcode = zipcode[0..4]
    end

  puts "#{name} #{zipcode}"
end

#prints zipcodes but now using a method

puts "---------------------------------------------------------"

def clean_zipcode(zipcode)
  if zipcode.nil?
    zipcode="00000"
  elsif zipcode.length < 5
    zipcode = zipcode.rjust 5, "0"
  elsif zipcode.length > 5
    zipcode = zipcode[0..4]
  else
    zipcode
  end

end

contents=CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

contents.each do |row |
  name=row[:first_name]

  zipcode=clean_zipcode(row[:zipcode])

  puts "#{name} #{zipcode }"

end

#cleaner zipcode method

puts "----------------------------------------------------"

def cleaner_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]

end

contents=CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

contents.each do |row |
  name=row[:first_name]

  zipcode=cleaner_zipcode(row[:zipcode])

  puts "#{name} #{zipcode }"

end
