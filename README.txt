メモ用ファイル


riot api
https://developer.riotgames.com/api-methods/#champion-mastery-v3


レスポンスはjson
id等から試合データなどを取ってくる。

curl --request GET 'https://jp1.api.riotgames.com/lol/champion-mastery/v3/champion-masteries/by-summoner/ここにサモナーネーム?api_key=ここにapikey' --include


curl --request GET 'https://jp1.api.riotgames.com/lol/champion-mastery/v3/champion-masteries/by-summoner/ここにさもなーid(上記からアカウント情報取得したもの)?api_key=ここにapikey' --include


curl --request GET 'https://jp1.api.riotgames.com/lol/platform/v3/champions/ここにチャンピオンid(上記でプレイヤーがよくプレイするチャンピオンを取得後)?api_key=ここにapikey' --include


簡単な開発手順

サイトからチーム名取得
toppageに取得したチーム一覧を表示(selectか単純にバーっと。部分一致検索ができるとよいかも？)

チーム選択後、ページ下部にajaxで
メンバーの現在のtierとランク上位３チャンプくらいを取得


db構成
データベース名:lol_teams
テーブル:lol_team
・id(主キー)
・チーム名
テーブル:team_url
・id
・チームid(外部キー)
テーブル:player
・id
・チームid(外部キー)
・サモナーネーム

lol_team-team_url　１対１
lol_team-player １対多
