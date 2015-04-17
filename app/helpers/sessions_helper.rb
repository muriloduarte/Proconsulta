# File: sessions_helper.rb 
# Purpose of module: This is a helper and contains methods for sessions      	# control and view 
# This software follows GPL license.
# Proconsulta Group.
# FGA-UnB Faculdade de Engenharias do Gama - Universidade de Brasília
module SessionsHelper

	# Execute the signin of user object passed as argument.	
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	# Execute signin of current user passed as argument. This method do not use
	# cookies data for remember user.
	def simple_sign_in(user)
		self.current_user = user
	end

	# Verify if the user is logged.
	def signed_in?
		!current_user.nil?
	end

	# If the user is nil, then storage an instance of user session.
	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user=(user)
		@current_user = user
	end

	# Sign out current user.
	def sign_out

		# Current user now is new.
		self.current_user = nil

		# The data cookies are deleted.
		cookies.delete(:remember_token)
	end

	# Get uf of current user logged.
	def current_uf
		current_user.address_user
	end

	def current_uf=(address_user)
		current_uf = address_user
	end
end
