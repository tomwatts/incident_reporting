#!/usr/bin/env ruby

require_relative "percentage_time_at_least_one_incident.rb"
require "test/unit"

class TestPagerDutyCodeTest < Test::Unit::TestCase

	def test_simple
		assert_equal(0.6, percentage_time_at_least_one_incident((10..20), [(8..15), (18..19)]))
		assert_equal(0.5, percentage_time_at_least_one_incident((40..70), [(50..60), (50..62), (50..65)]))
		assert_equal(0.8, percentage_time_at_least_one_incident((0..100), [(-10..60), (50..65), (50..80)]))
		assert_equal(1.0, percentage_time_at_least_one_incident((0..100), [(-10..60), (50..65), (50..110)]))
		assert_equal(0.0, percentage_time_at_least_one_incident((0..100), [(-10..0), (0..0), (100..110)]))
		assert_equal(0.0, percentage_time_at_least_one_incident((0..100), []))
		assert_equal(0.6, percentage_time_at_least_one_incident((10..20), [(12..18), (13..15)]))
		assert_equal(0.6, percentage_time_at_least_one_incident((10..20), [(12..18), (13..15), (14..15)]))
		assert_equal(1.0, percentage_time_at_least_one_incident((10..20), [(10..20), (12..18), (13..15), (14..15)]))
		assert_equal(0.9, percentage_time_at_least_one_incident((10..20), [(10..19)]))
		assert_equal(0.9, percentage_time_at_least_one_incident((10..20), [(11..20)]))
		assert_equal(0.7, percentage_time_at_least_one_incident((10..20), [(12..18), (13..19), (14..15)]))
		assert_equal(1.0, percentage_time_at_least_one_incident((10..20), [(10..15), (15..19), (19..20)]))
		assert_equal(0.4, percentage_time_at_least_one_incident((10..20), [(10..12), (18..20)]))
		assert_equal(nil, percentage_time_at_least_one_incident((0..0), [(12..18), (13..19), (14..15)]))
	end

end

#query = Range.new(0, 0)
#incidents = [Range.new(8, 15), Range.new(18, 19)]
#puts "7. Expects nil: " + percentage_time_at_least_one_incident(query, incidents).to_s

# ==========
#   ++++++
#    --
