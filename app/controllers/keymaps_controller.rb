class KeymapsController < ApplicationController
  def index
    @keymaps = Keymap.all
  end

  def show
    @keymap = Keymap.find(params[:id])
  end

end