class CreateKeymaps < ActiveRecord::Migration[7.0]
  def change
    create_table :keymaps do |t|
      t.string :label
      t.string :keys
      t.integer :keymap_len
      t.boolean :specific

      t.timestamps
    end
  end
end
