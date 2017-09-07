module TimetasticBot
  module Commands
    class Leave < SlackRubyBot::Bot
      command 'leave' do |client,data,match|
        timetastic_data = match[:expression].split /\s*from\s+|\s*to\s+|\s*because\s+/
        user_email = client.users[data.user]['profile']['email']
        from_date = timetastic_data[1]
        to_date = timetastic_data[2]
        reason = timetastic_data[3]
        response = Timetastic::Holiday.book(from_date,to_date,0,0,reason,"Holiday",user_email)
        if response["success"] == true
    	    client.say(text: "Congratulations <@#{data.user}>! Your leave is booked from #{from_date} to #{to_date}", channel: data.channel)
        else
         client.say(text: "Aaouch! <@#{data.user}, there was an issue booking your leave. Please try again", channel: data.channel)
        end
      end
    end
  end
end
