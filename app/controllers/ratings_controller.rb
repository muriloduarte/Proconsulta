class RatingsController < ApplicationController
	
	def index
		if(!signed_in?)
			redirect_to root_path
			flash[:notice] = "Necessario estar logado para realizar avaliacao"
		else
			#Nothing to do
		end
	end
end