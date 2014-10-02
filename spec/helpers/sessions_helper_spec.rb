require 'rspec/its'
require 'spec_helper'
require 'rails_helper'

describe SessionsHelper do
	before do
		@user = User.create(name_user: "UserTes", email_user: "usertest@test.com",
		 password: "teste1234", address_user: "DF",
		 password_confirmation: "teste1234")
	end

	it "expect signed user return signed_in = true" do
		current_user=(@user)
		sign_in(@user)
		expect(signed_in?).to be(true)
	end

	it "expect signout user to return signed_in = false" do
		current_user=(@user)
		sign_out
		expect(signed_in?).to be(false)
	end
end
