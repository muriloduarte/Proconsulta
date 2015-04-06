# File: sessions_helper.rb 
# Purpose of module: This is a helper and contains methods for application    # control and view. 
# This software follows GPL license.
# Proconsulta Group.
# FGA-UnB Faculdade de Engenharias do Gama - Universidade de Brasília
module ApplicationHelper
	
	# Determines the page header
	def full_title(page_title)
		base_title = "PROCONSULTA"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
