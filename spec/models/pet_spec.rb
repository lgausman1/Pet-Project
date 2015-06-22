require 'rails_helper'
require 'spec_helper'

describe Pet do
  it "succeeds in creating a pet" do
    pet = Pet.new({
    	name: "fluffers",
    	shelter_location: "SF SPCA",
    	thumbnail: "http://newimages.mobi/wp-content/uploads/fluffy-bunny-photos-4.jpg"
    	})
    expect(pet.save).to be_truthy
  end
 
 it "responds to something" do
 	 pet = Pet.create({
    	name: "fluffers",
    	shelter_location: "SF SPCA",
    	thumbnail: "http://newimages.mobi/wp-content/uploads/fluffy-bunny-photos-4.jpg"
    	})
 	expect(pet).to respond_to(:name)
 end
end

