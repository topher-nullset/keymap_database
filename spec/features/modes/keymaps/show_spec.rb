require "rails_helper"

RSpec.describe "Mode keymaps index" do
  before :each do
    @normal =  Mode.create!(name: "Normal", variations: 2, dangerous: false)
    @insert =  Mode.create!(name: "Insert", variations: 2, dangerous: true)
    @keymap1 = @normal.keymaps.create!(label: "Project View", keys: "<space>pv", keymap_len: 3, specific: true)
    @keymap2 = @normal.keymaps.create!(label: "Add harpoon marker", keys: "<space>a", keymap_len: 2, specific: true)
  end

  it "shows the keymaps and their attributes assoiciated to that mode" do
    visit "/modes/#{@normal.id}/keymaps"
    
    expect(page).to have_content(@keymap1.label)
    expect(page).to have_content(@keymap2.label)
  end
end