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

# use for integration testing(full-stack/redirect and view expecations)
# RSpec.describe "Widget management", :type => :request do

#   it "creates a Widget and redirects to the Widget's page" do
#     get "/widgets/new"
#     expect(response).to render_template(:new)

#     post "/widgets", :widget => {:name => "My Widget"}

#     expect(response).to redirect_to(assigns(:widget))
#     follow_redirect!

#     expect(response).to render_template(:show)
#     expect(response.body).to include("Widget was successfully created.")
#   end

# end