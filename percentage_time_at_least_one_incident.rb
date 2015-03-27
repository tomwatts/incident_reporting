# Provides the percentage of time wherein at least one incident is open for the
# given query time period.
# 
# * *Args*    :
#   - +query+ -> Range indicating the start and end times of the query period.
#   - +incidents+ -> An array of Ranges that hold the start and end times of
#     various incidents, sorted lexicographically.
# * *Returns* :
#   - A Float that represents the ratio of time with at least one open incident
#     to total time in the query period.  Nil if the query time period is <= 0.

def percentage_time_at_least_one_incident(query, incidents)
   total_incident_time = 0
   time = query.first

   for incident in incidents do
      # Since incidents are sorted, we can jump to incident start time if it's
      # in the future
      time = [time, incident.first].max

      # Are we in the query range and before the current incident end time?
      if (time >= query.first && time < query.end && time < incident.end)
	       # Accumulate incident time by adding time between current time and
	       # incident or query end time, whichever is sooner
	       total_incident_time += [incident.end, query.end].min - time
	       time = incident.end
      end
   end

   # Query start is not guaranteed to be less than end...
   query_time = query.end - query.first
   # so check to see if it's > 0
   if query_time > 0
      total_incident_time.to_f / query_time
   else
      nil
   end
end

