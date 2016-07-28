class MovesController < ApplicationController

  def index
    @moves = Move.all

    

  end

  def new
    if params[:hyperdrive]
      @hyperdrive = params[:hyperdrive]
      @move = Move.new
      @planets = session[:planets]
      @vehicles = Vehicle.new.names
      @starships = Starship.new.names
      session[:planets] = @planets
      session[:vehicles] = @vehicles
      session[:starships] = @starships

    else
      @move = Move.new
      @planets = Planet.new.names
       session[:planets] = @planets
  

    end
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
    @people = Person.new.people
    to_planet = Planet.new.planets.select {|planet| planet.name == @move.to}
    @to_planet_url = to_planet[0].url
    from_planet = Planet.new.planets.select {|planet| planet.name == @move.from}
    @from_planet_url = from_planet[0].url
  end

  def edit
    @move = Move.find(params[:id])
    @planets = session[:planets]
    @vehicles = session[:vehicles]
    @starships = session[:starships]
    if session[:people]
      @people = session[:people]
    else
      @people = Person.new.names
      session[:people] = @people
    end
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
    params.require(:move).permit(:name, :date, :to, :from, :vehicle, "to_movers", "from_movers")
  end



end
