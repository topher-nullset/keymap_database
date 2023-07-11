require "rails_helper"

RSpec.describe "Keymaps index" do
  before :each do
    
    @normal =  Mode.create!(name: "Normal", variations: 2, dangerous: false)
    @keymap1 = @normal.keymaps.create!(label: "Project View", keys: "<space>pv", keymap_len: 3, specific: true)
    @keymap2 = @normal.keymaps.create!(label: "Add harpoon marker", keys: "<space>a", keymap_len: 2, specific: true)
  end

  it "Shows the keymap labels" do
    visit "/keymaps"

    expect(page).to have_content(@keymap1.label)
    expect(page).to have_content(@keymap2.label)
  end


  it "Show the keymap information" do
    visit "/keymaps/#{@keymap1.id}"
    
    expect(page).to have_content(@keymap1.label)
    expect(page).to have_content("NViM Keymap: <space>pv")
    expect(page).to have_content("Mode: Normal")
    expect(page).to have_content("How much typing: 3")
    expect(page).to have_content("Mode specific: true")
  end

  it "has a link to the modes" do
    visit "/"
    
    expect(page).to have_link("Modes", href: modes_path)
  end
end