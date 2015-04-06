# File: rating_controller.rb
+# Purpose of class: Contains action methods for rating view.
+# This software follows GPL license.
+# Proconsulta Group.
+# FGA-UnB Faculdade de Engenharias do Gama - Universidade de Brasília.
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