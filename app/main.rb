require_relative '../db/config'
require_relative 'models/legislator'

# puts legislator = Legislator.find(15)
# puts legislator.firstname

def legislators_of(state)
  senators = Legislator.where("state = ?", state).where("title='Sen'").order("lastname ASC")
  representatives = Legislator.where("state = ?", state).where("title='Rep'").order("lastname ASC")

  puts "Senators"
  senators.map do |senator|
    puts "\t#{senator.title} #{senator.firstname} #{senator.middlename} #{senator.lastname} (#{senator.party})"
  end

  puts "\nRepresentatives:"
  representatives.map do |rep|
    puts "\t#{rep.title} #{rep.firstname} #{rep.middlename} #{rep.lastname} #{rep.state} (#{rep.party})"
  end
end

def percentage_of_legislators_of_gender(gender)
  representatives_of_gender_count = Legislator.where("title = 'Rep'").where("gender = ?", gender).where("in_office = 1").size
  senators_of_gender_count = Legislator.where("title = 'Sen'").where("gender = ?", gender).where("in_office = 1").size

  total_representatives = Legislator.where("title = 'Rep'").size
  total_senators = Legislator.where("title = 'Sen'").size

  rep_percentage = ((representatives_of_gender_count.to_f / total_representatives) * 100).round
  sen_percentage = ((senators_of_gender_count.to_f / total_senators) * 100).round
  
  puts "#{gender} Senators: #{senators_of_gender_count} (#{rep_percentage}%)"
  puts "#{gender} Representatives: #{representatives_of_gender_count} (#{sen_percentage}%)" 
end

def active_legislators
  #desc order
  all_states = ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY'] 

  sen_count = []
  rep_count = []
  count_hash = {}

  all_states.each do |state|
    sen_count << Legislator.where("state = ?", state).where("title = 'Sen'").size
    rep_count << Legislator.where("state = ?", state).where("title = 'Rep'").size
  end

  all_states.each_with_index do |state, i|
    count_hash[state] = sen_count[i], rep_count[i]
  end

  puts "Active Legislators:\n\n"
  count_hash.each do |k,v|
    puts "#{k}: #{v[0]} Senators, #{v[1]} Representative(s) "
  end
end

def legislator_count
  total_representatives = Legislator.where("title = 'Rep'").size
  total_senators = Legislator.where("title = 'Sen'").size

  puts "Senators: #{total_senators}"
  puts "Representatives: #{total_representatives}"
end

def delete_inactive
  Legislator.delete_all("in_office = 0")
end

legislators_of('CA')
# legislators_of('IA')
# legislators_of('WV')
# percentage_of_legislators_of_gender('M') 
# percentage_of_legislators_of_gender('F') 
# legislator_count
# active_legislators
# delete_inactive
# legislator_count

