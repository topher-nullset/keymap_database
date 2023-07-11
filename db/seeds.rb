# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Mode.destroy_all
Keymap.destroy_all

@normal =  Mode.create!(name: "Normal", variations: 2, dangerous: false)
@insert =  Mode.create!(name: "Insert", variations: 2, dangerous: true)
@keymap1 = @normal.keymaps.create!(label: "Project View", keys: "<space>pv", keymap_len: 3, specific: true)
@keymap2 = @normal.keymaps.create!(label: "Add harpoon marker", keys: "<space>a", keymap_len: 2, specific: true)