class ModesController < ApplicationController
  def index
    @modes = Mode.all
  end

  def show
    @mode = Mode.find(params[:id])
  end

  def new

  end

  def create
    mode = Mode.create(mode_params)
    redirect_to "/modes"
  end

  def edit
    @mode = Mode.find(params[:id])
  end

  def update
    mode = Mode.find(params[:id])
    mode.update(mode_params)
    redirect_to "/modes/#{mode.id}"
  end

private
  def mode_params
    params.permit(:name, :variations, :dangerous)
  end

end