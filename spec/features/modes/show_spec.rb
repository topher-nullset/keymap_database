require "rails_helper"

  RSpec.describe "Modes index" do
    before :each do
      @normal =  Mode.create!(name: "Normal", variations: 2, dangerous: false)
      @insert =  Mode.create!(name: "Insert", variations: 2, dangerous: true)
      @keymap1 = @normal.keymaps.create!(label: "Project View", keys: "<space>pv", keymap_len: 3, specific: true)
      @keymap2 = @normal.keymaps.create!(label: "Add harpoon marker", keys: "<space>a", keymap_len: 2, specific: true)
    end

    it "shows the name of each mode" do
      visit "/modes"
      
      expect(page).to have_content(@normal.name)
      expect(page).to have_content(@insert.name)
    end
    
    it "shows information about the mode" do
      visit "/modes/#{@normal.id}"
      
      expect(page).to have_content(@normal.name)
      expect(page).to have_content("Variations: 2")
      expect(page).to have_content("Dangerous: false")
    end

    it "has a link to the keymaps" do
      visit "/modes/#{@normal.id}"
      
      click_on "Mode Keymaps"

      expect(current_path).to eq("/modes/#{@normal.id}/keymaps")
    end
    

    it "has a link to the keymaps" do
      visit "/"
      
      expect(page).to have_link("Keymaps", href: keymaps_path)
    end
  end

