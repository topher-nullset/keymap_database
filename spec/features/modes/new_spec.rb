require 'rails_helper'

RSpec.describe "The Mode creation" do    
  it "has a button to create a new parent" do
    visit "/modes"
    click_link "New Mode"
    
    expect(current_path).to eq("/modes/new")
    
    fill_in("Name", with: "Visual")
    fill_in("Variations", with: 2)
    click_button("Create Mode")
    
    expect(current_path).to eq("/modes")
    expect(page).to have_content("Visual")
  end
end