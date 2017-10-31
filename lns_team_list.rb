require 'mechanize'

agent = Mechanize.new

page = agent.get('http://lns-lol.com/Ladder/display')
elements = page.search('tr a')

teams = {}

elements.each do |ele|
  teams["#{ele.text}"] = ele[:href]
end

puts teams

teams.each do |team|
  agent.get('http://lns-lol.com/Team/#{team.value}')
end

