require 'rails_helper'

RSpec.describe "The Mode edit" do
  before :each do
    @normal =  Mode.create!(name: "Normal", variations: 2, dangerous: false)
    @insert =  Mode.create!(name: "Insert", variations: 2, dangerous: true)
    @keymap1 = @normal.keymaps.create!(label: "Project View", keys: "<space>pv", keymap_len: 3, specific: true)
    @keymap2 = @normal.keymaps.create!(label: "Add harpoon marker", keys: "<space>a", keymap_len: 2, specific: true)
  end

  it "has a button to edit a mode" do
    visit "/modes/#{@normal.id}"
    click_link "Update #{@normal.name} Mode"
    
    fill_in("Name", with:"Normal+")
    fill_in("Variations", with: 3)
    click_button("Update Mode")
    
    expect(current_path).to eq("/modes/#{@normal.id}")
    expect(page).to have_content("Normal+")
    expect(page).to have_content("Variations: 3")
  end
end
