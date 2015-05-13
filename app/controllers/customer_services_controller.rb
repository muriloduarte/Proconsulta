# File: password_resets_controller.rb 
# Purpose of class: This class is a controller and contains action methods for 
# custumer services view.
# This software follows GPL license.
# Proconsulta Group.
# FGA-UnB Faculdade de Engenharias do Gama - Universidade de Brasília
class CustomerServicesController < ApplicationController

	# List all Customer_Services
	def index 
		@search = CustomerService.search(params[:q])
		@customer_services_search = @search.result
		@customer_services = @customer_services_search.paginate(page: params[:page])
		@hash_uf = return_hash
	end

	def graphs
		@customer_services = CustomerService.paginate(page: params[:page])
		@hash_uf = return_hash
		@hash_uf_filter = []
		@hash_region = return_hash_region#
	end

	# List Customer_Service related to one especific id.
	def show 
	  @customer_service = CustomerService.find(params[:id])
	end

	def return_hash
		hash = []
		all_uf = UfHelper.all
		all_uf.each do |uf|

			# REVIEW: modulate this conditional. 
			# 	filter_customer_service_by_type use the same conditional. 
			if uf.description_uf == nil
				uf.description_uf = "vazio"
			else
				# Nothing to do
			end
			hash[uf.description_uf] = uf.quantity_uf.to_i
		end
		hash
	end

		QUANTITY_ALL = 0
		QUANTITY_DIRECT_COMPLAINT = 1
		QUANTITY_PRELIMINARY_SERVICE = 2
		QUANTITY_CALCULATION = 3
		QUANTITY_CIP = 4
		QUANTITY_FORWARD_SUPERVISION = 5
		QUANTITY_INITIAL_JEC = 6
		QUANTITY_LETTER_COMPLAINT = 7
		QUANTITY_SIMPLE_CONSULT = 8

	def filter_customer_service_by_type
		hash = []
		all_uf = UfHelper.all
		type_service = params[:type].to_i
		all_uf.each do |uf|

			# REVIEW: modulate this conditional.
			if uf.description_uf == nil
				uf.description_uf = "vazio"
			else
				# Nothing to do
			end
			# To apply this case on style sheet ruby
			hash[uf.description_uf] = case type_service
																when QUANTITY_ALL then uf.quantity_uf
																when QUANTITY_DIRECT_COMPLAINT
				 													then uf.quantity_direct_complaint
																when QUANTITY_PRELIMINARY_SERVICE
																	then uf.quantity_preliminary_service
																when QUANTITY_CALCULATION
																	then uf.quantity_calculation
																when QUANTITY_CIP then uf.quantity_direct_cip
																when QUANTITY_FORWARD_SUPERVISION
																	then uf.quantity_forward_supervision
																when QUANTITY_INITIAL_JEC
																	then uf.quantity_initial_jec
																when QUANTITY_LETTER_COMPLAINT
																	then uf.quantity_letter_complaint
																when QUANTITY_SIMPLE_CONSULT
																	then uf.quantity_simple_consult
																end
		end
		render :json => hash.to_json
	end

	not_exist_region_description = region.description_region == nil
	def return_hash_region
		hash = []
		all_region = Region.all
		all_region.each do |region|

			# REVIEW: this conditional must modulate in helper. 
			# 	The filter_custumer_service_by_type_region use the same conditional.
			if not_exist_region_description
				region.description_region = "vazio"
			else
				# Nothing to do
			end
			hash[region.description_region] = region.quantity_region.to_i
		end
		hash
	end

	def compare_customer_service_by_type(hash, region, type_service)
		hash[region.description_region] = case type_service
																			when QUANTITY_DIRECT_COMPLAINT
																				then region.quantity_direct_complaint
																			when QUANTITY_PRELIMINARY_SERVICE
																				then region.quantity_preliminary_service
																			when QUANTITY_CALCULATION
																				then region.quantity_calculation
																			when QUANTITY_CIP
																				then region.quantity_direct_cip
																			when QUANTITY_FORWARD_SUPERVISION
																				then region.quantity_forward_supervision
																			when QUANTITY_INITIAL_JEC
																				then region.quantity_initial_jec
																			when QUANTITY_LETTER_COMPLAINT
																				then region.quantity_letter_complaint
																			when QUANTITY_SIMPLE_CONSULT
																				then region.quantity_simple_consult
																			end
	end

	def filter_customer_service_by_type_region
		hash = []
		all_region = Region.all
		type_service = params[:type].to_i
		all_region.each do |region|

			# REVIEW: modulate this conditional.
			if region.description_region == nil
				region.description_region = "vazio"
			end
			compare_customer_service_by_type(hash, region, type_service)
		end
		render :json => hash.to_json
	end
end
