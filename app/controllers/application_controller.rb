# File: application_controller.rb
+# Purpose of class: Contains action methods for application view.
+# This software follows GPL license.
+# Proconsulta Group.
+# FGA-UnB Faculdade de Engenharias do Gama - Universidade de Brasília.
class ApplicationController < ActionController::Base
	protect_from_forgery
	include SessionsHelper

	#force signout to prevent CSRF attacks
	def handle_unverified_request
		sign_out
		super
	end
end
