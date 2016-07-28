class MovesController < ApplicationController

  def index
    @moves = Move.all
    session[:planets] = Planet.new.all
    session[:vehicle] = Vehicle.new.all

  end

  def new
    @move = Move.new
    @planets = session[:planets]
    @vehicles = session[:vehicle]
  end

  def create
    @move = Move.new(whitelisted_params)
    if @move.save
      flash[:success] = "Your move has been saved!"
      redirect_to move_path(@move.id)
    else
      flash.now[:error] = "Your move could not be saved. Please check the error message"
      render :new
    end
  end

  def show
    @move = Move.find(params[:id])
  end

  def edit
    @move = Move.find(params[:id])
    @planets = session[:planets]
    @vehicles = session[:vehicle]
  end

  def update
     @move = Move.find(params[:id])
    if @move.update(whitelisted_params)
      flash[:success] = "Your move has been saved!"
      redirect_to move_path(@move.id)
    else
      flash.now[:error] = "Your move could not be saved. Please check the error message"
      render :new
    end

  end

  def destroy
    @move = Move.find(params[:id])
    @move.destroy
    flash[:success] = "Your move has been deleted"

    redirect_to moves_path
  end





  private

  def whitelisted_params
    params.require(:move).permit(:name, :date, :to, :from, :vehicle)
  end

end
