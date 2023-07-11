class Modes::KeymapsController < ApplicationController
  def index
    @mode = Mode.find(params[:id])
    @keymaps = @mode.keymaps
  end

  def new
    @mode = Mode.find(params[:id])
  end

  def create
    @mode = Mode.find(params[:id])
    keymap = @mode.keymaps.create(keymap_params)
    redirect_to "/modes/#{keymap.mode_id}/keymaps"
  end

  private

  def keymap_params
    params.permit(:label, :keys, :keymap_len, :specific)
  end
end