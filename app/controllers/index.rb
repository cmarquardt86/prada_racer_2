get '/' do
  redirect "/games/new"
end

get "/games/new" do
	erb :"games/new"
end

post "/games" do
	game = Game.create(start_time: Time.now)
	game.players << Player.where(:name => params[:player_1_name]).first_or_create
	game.players << Player.where(:name => params[:player_2_name]).first_or_create
	redirect "/games/#{game.id}"
end

get "/games/:id" do |id|
	@game = Game.find(id)
	erb :"games/show"
end	

put "/games/:id" do |id|
	game = Game.find(id) 
	game.end_time = Time.now
	game.winner_id = Player.where(:name => params[:winner]).first.id
	game.save
end

get "/game_results/:id" do |id|
	@game = Game.find(id) 
 	erb :"game_results/show"
end