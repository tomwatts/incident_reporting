# Provides the percentage of time wherein at least one incident is open for the
# given query time period.
# 
# * *Args*    :
#   - +query+ -> Range indicating the start and end times of the query period.
#   - +incidents+ -> An array of Ranges that indicate the start and end times
#                    of various incidents.
# * *Returns* :
#   - A Float that represents the ratio of time with at least one open incident
#     to total time in the query period.  Nil if the query time period is <= 0.

def percentage_time_at_least_one_incident(query, incidents)
	total_incident_time = 0
	time = query.first
	# Loop over each time unit in query range
	until time >= query.end do
		time_updated = false
		for incident in incidents do
			# Do we have an open incident at this time?
			if (time >= incident.first && time < incident.end)
				# Accumulate incident time by adding time between current and
				# incident or query end time, whichever is sooner
				total_incident_time += [incident.end, query.end].min - time
				# Skip to incident end time to avoid counting overlap
				time = incident.end
				time_updated = true
			end
		end
		# Increment the current time if no open icidents were found at this time
		time += 1 unless time_updated
	end

	query_time = query.end - query.first
	if query_time > 0
		total_incident_time.to_f / query_time
	else
		nil
	end
end

