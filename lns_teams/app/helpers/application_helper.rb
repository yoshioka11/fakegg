module ApplicationHelper
  def get_summoner_params(sumname)
    sum_params = "#{RIOTAPI_CONFIG["apiurl"]["summoner_params"]}#{sumname}?api_key=#{RIOTAPI_CONFIG[Rails.env]["apikey"]}"
    sum_params = URI.escape(sum_params)
    sum_params = open(sum_params)
    sum_params = JSON.parse(sum_params.read)
    get_summoner_champs(sum_params["id"])
  end

  def get_summoner_champs(sumid)
    most_champs = []
    sum_champ = "#{RIOTAPI_CONFIG["apiurl"]["summoner_champ"]}#{sumid}?api_key=#{RIOTAPI_CONFIG[Rails.env]["apikey"]}"
    sum_champ = URI.escape(sum_champ)
    sum_champ = open(sum_champ)
    sum_champ = JSON.parse(sum_champ.read)
    sum_champ.each.with_index(0) do |champ, i|
      champ_name = "#{RIOTAPI_CONFIG["apiurl"]["champ_name"]}#{champ["championId"]}?locale=ja_JP&api_key=#{RIOTAPI_CONFIG[Rails.env]["apikey"]}"
      champ_name = URI.escape(champ_name)
      champ_name = open(champ_name)
      champ_name = JSON.parse(champ_name.read)
      most_champs << champ_name["name"]
      break if i == 2
    end
    most_champs
  end

  def get_most_champs()

  end
end
