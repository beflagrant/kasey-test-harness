class OuttakesController < ApplicationController
  before_action :set_outtake, only: [:show, :edit, :update, :destroy]

  # GET /outtakes
  # GET /outtakes.json
  def index
    @outtakes = Outtake.all
  end

  # GET /outtakes/1
  # GET /outtakes/1.json
  def show
  end

  # GET /outtakes/new
  def new
    @outtake = Outtake.new
  end

  # GET /outtakes/1/edit
  def edit
  end

  # POST /outtakes
  # POST /outtakes.json
  def create
    @outtake = Outtake.new(outtake_params)

    respond_to do |format|
      if @outtake.save
        format.html { redirect_to @outtake, notice: 'Outtake was successfully created.' }
        format.json { render :show, status: :created, location: @outtake }
      else
        format.html { render :new }
        format.json { render json: @outtake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outtakes/1
  # PATCH/PUT /outtakes/1.json
  def update
    respond_to do |format|
      if @outtake.update(outtake_params)
        format.html { redirect_to @outtake, notice: 'Outtake was successfully updated.' }
        format.json { render :show, status: :ok, location: @outtake }
      else
        format.html { render :edit }
        format.json { render json: @outtake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outtakes/1
  # DELETE /outtakes/1.json
  def destroy
    @outtake.destroy
    respond_to do |format|
      format.html { redirect_to outtakes_url, notice: 'Outtake was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outtake
      @outtake = Outtake.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def outtake_params
      params.require(:outtake).permit(:full_name, :email, :n_decimal, :n_float, :n_integer, :is_ok, :note, :birthday, :local_noon)
    end
end
