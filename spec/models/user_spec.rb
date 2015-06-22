require 'rails_helper'
require 'spec_helper'


describe User do
  it "fails because no password" do
    expect(User.new({:first_name => "hans"}).save).to be_falsey
  end
 
  it "fails because password to short" do
    expect(User.new({:email => "hans", 
      :password_digest => 'han'}).save).to be_falsey
  end
 
  it "succeeds because password is long enough" do
    user = User.new({
    	email: "hans",
      password: 'hansohanso',
      password_confirmation: 'hansohanso',
      first_name: "hey",
      last_name: "you",
      survey_info: "{key: 'value'}"
     })
    expect(user.save).to be_truthy
  end
 
end

# use as a basis for integration testing(full-stack/redirect and view expecations)
RSpec.describe "User login", :type => :request do

  it "creates a user and redirects to the user's page" do
    get "/users/new"
    expect(response).to render_template(:new)

 end
 end