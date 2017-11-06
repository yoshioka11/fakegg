require "open-uri"
class Scraping
  def self.team_data
    puts 'get team names'
    agent = Mechanize.new
    page = agent.get('http://lns-lol.com/Ladder/display')
    elements = page.search('tr a')
    sum = 1
    elements.each do |ele|
      Team.create(teamname: ele.text)
      team_id = Team.find_by(id: sum).id
      TeamUrl.create(team_url: ele[:href],team_id: team_id)
      get_player("http://lns-lol.com#{ele[:href]}", team_id)
      sum = sum + 1
    end
  end

  def self.get_player(link,team_id)
    puts 'get players'
    agent = Mechanize.new
    page = agent.get(link)
    page = page.search('.table-bordered')[1]
    page = page.search('tr')
    name = []
    ref_name = []
    page.each do |pageo|
      name << pageo.to_s.gsub(" ","").gsub("　","").gsub("<tr>","").gsub("</tr>","").gsub("<td>","").gsub("</td>","").gsub("確認済み","")
    end
    name.each do |n|
      ref_name << n.gsub("\n","").gsub("ADC","").gsub("Mid","").gsub("Jungle","").gsub("Top","").gsub("Support","")
    end
    ref_name.each.with_index(1) do |nam, i|
      unless i == 1
        Player.create(sumoner_name: nam,team_id: team_id)
      end
    end
  end

  def self.get_test
    puts 'get players'
    agent = Mechanize.new
    page = agent.get("http://lns-lol.com/Team/Detail/96")
    page = page.search('.table-bordered')[1]
    page = page.search('tr')
    name = []
    ref_name = []
    page.each do |pageo|
      name << pageo.to_s.gsub(" ","").gsub("　","").gsub("<tr>","").gsub("</tr>","").gsub("<td>","").gsub("</td>","").gsub("確認済み","")
    end
    name.each do |n|
      ref_name << n.gsub("\n","").gsub("ADC","").gsub("Mid","").gsub("Jungle","").gsub("Top","").gsub("Support","")
    end
    ref_name.each.with_index(1) do |nam, i|
      unless i == 1
        puts nam
      end
    end
  end

  def self.get_champion
    puts 'get champions'
    champions = "https://jp1.api.riotgames.com/lol/static-data/v3/champions?locale=ja_JP&dataById=false&api_key=RGAPI-3768bb6b-d3a1-47cf-985a-a61dee379453"
    champions = URI.escape(champions)
    champions = open(champions)
    champions = JSON.parse(champions.read)
    champions = champions["data"]
    champions.each do |key,value|
      Champion.create(champion: value["name"],champion_id: value["id"])
    end
  end
end
