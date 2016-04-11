require 'csv'

desc 'Migrate events from csv file to database'
task import_events: :environment do
   csv = CSV.open("data/test_events.csv", :headers => true,
                                          :header_converters => :symbol,
                                          :converters => :all)
   event_hash = csv.to_a.map { |row| row.to_hash }
   event_hash.each do |row|
     track = Track.find_or_create_by(name: row[:track])
     Event.create(start_time: DateTime.parse(row[:start]),
                  end_time: DateTime.parse(row[:finish]),
                  name: row[:name],
                  track_id: track.id,
                  day: DateTime.parse(row[:start]).strftime("%m/%d")
                  )
   end
end
