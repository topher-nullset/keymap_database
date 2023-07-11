require 'rails_helper'

RSpec.describe 'The Mode Keymap Create button' do
  before :each do
    @normal =  Mode.create!(name: "Normal", variations: 2, dangerous: false)
    @insert =  Mode.create!(name: "Insert", variations: 2, dangerous: true)
    @keymap1 = @normal.keymaps.create!(label: "Project View", keys: "<space>pv", keymap_len: 3, specific: true)
    @keymap2 = @normal.keymaps.create!(label: "Add harpoon marker", keys: "<space>a", keymap_len: 2, specific: true)
  end

  it 'creates a new mode keymap' do
    visit "modes/#{@normal.id}/keymaps"
    
    expect(page).to have_content("Add harpoon marker")
    expect(page).to have_link("Create #{@normal.name} Keymap")
    click_link("Create #{@normal.name} Keymap")

    fill_in("label", with: "Harpoon Menu")
    fill_in("keys", with: "<C-e>")
    fill_in("keymap_len", with: 3)
    click_button("Create Keymap")
    
    expect(current_path).to eq("/modes/#{@normal.id}/keymaps")
    expect(page).to have_content("Harpoon Menu")
  end
end 
