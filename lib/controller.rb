require 'gossip'
class ApplicationController < Sinatra::Base
	get '/' do
		
		erb:index, locals: { gossips: Gossip.all }
	end

	get '/gossips/new/' do
		erb:new_gossip
	end
	post '/gossips/new/' do
		Gossip.new(params["gossip_author"] , params["gossip_content"] , "").save
		redirect '/'
	end
	get '/gossips/*/edit/' do
		erb:edit_gossip,locals: { gossips: Gossip.all , x: params[:splat][0]}
	end
	post '/gossips/*/edit/' do
	
		Gossip.new(params["gossip_author"] , params["gossip_content"] , x= params[:splat][0] ).edit
		

		redirect '/'
	end
	get '/gossips/*/' do
		
		erb:gossip,locals: { gossips: Gossip.all , x: params[:splat][0]}		
	end

end

=begin 
	post '/gossips/new/' do
		puts "Salut, je suis dans le serveur"
		puts "Ceci est mon super params : #{params}"
		puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
		puts "De la bombe, et du coup ça ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
		puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
		=end


=begin 

#require 'bundler'
#Bundler.require

class ApplicationController < Sinatra::Base
  get '/' do
    "<html><head><title>The Gossip Project</title></head><body><h1>Mon super site de gossip !</h1></body></html>"
  end

  #run! if app_file == $0
=end