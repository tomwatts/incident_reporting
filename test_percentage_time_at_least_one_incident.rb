#!/usr/bin/env ruby

require_relative("percentage_time_at_least_one_incident.rb")

#query = Range.new(10, 20)
#incidents = [Range.new(8, 15), Range.new(18, 19)]
#puts "1. Expects 0.6: " + percentage_time_at_least_one_incident(query, incidents).to_s

#query = Range.new(40, 70)
#incidents = [Range.new(50, 60), Range.new(50, 62), Range.new(50, 65)]
#puts "2. Expects 0.5: " + percentage_time_at_least_one_incident(query, incidents).to_s

#query = Range.new(0, 100)
#incidents = [Range.new(-10, 60), Range.new(50, 65), Range.new(50, 80)]
#puts "3. Expects 0.8: " + percentage_time_at_least_one_incident(query, incidents).to_s

#query = Range.new(0, 100)
#incidents = [Range.new(-10, 60), Range.new(50, 65), Range.new(50, 110)]
#puts "4. Expects 1.0: " + percentage_time_at_least_one_incident(query, incidents).to_s

#query = Range.new(0, 100)
#incidents = [Range.new(-10, 0), Range.new(0, 0), Range.new(100, 110)]
#puts "5. Expects 0.0: " + percentage_time_at_least_one_incident(query, incidents).to_s

#query = Range.new(0, 100)
#incidents = []
#puts "6. Expects 0.0: " + percentage_time_at_least_one_incident(query, incidents).to_s

#query = Range.new(0, 0)
#incidents = [Range.new(8, 15), Range.new(18, 19)]
#puts "7. Expects nil: " + percentage_time_at_least_one_incident(query, incidents).to_s

query = Range.new(10, 20)
incidents = [Range.new(12, 18), Range.new(13, 15)]
puts "1. Expects 0.6: " + percentage_time_at_least_one_incident(query, incidents).to_s

