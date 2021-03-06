class InitiativesController < ApplicationController
  layout 'ongs'

  before_action :set_ong, only: [:index, :show]
  before_action :set_initiative, only: [:show, :edit, :update, :destroy]

  # GET /initiatives
  # GET /initiatives.json
  def index
    @initiatives = @ong.initiatives.active
  end

  # GET /initiatives/1
  # GET /initiatives/1.json
  def show
    @sign = InitiativeSign.new
  end

  # GET /initiatives/new
  def new
    @initiative = Initiative.new
  end

  # GET /initiatives/1/edit
  def edit
  end

  # POST /initiatives
  # POST /initiatives.json
  def create
    @initiative = Initiative.new(initiative_params)

    respond_to do |format|
      if @initiative.save
        format.html { redirect_to @initiative, notice: 'Initiative was successfully created.' }
        format.json { render :show, status: :created, location: @initiative }
      else
        format.html { render :new }
        format.json { render json: @initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /initiatives/1
  # PATCH/PUT /initiatives/1.json
  def update
    respond_to do |format|
      if @initiative.update(initiative_params)
        format.html { redirect_to @initiative, notice: 'Initiative was successfully updated.' }
        format.json { render :show, status: :ok, location: @initiative }
      else
        format.html { render :edit }
        format.json { render json: @initiative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /initiatives/1
  # DELETE /initiatives/1.json
  def destroy
    @initiative.destroy
    respond_to do |format|
      format.html { redirect_to initiatives_url, notice: 'Initiative was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_initiative
      @initiative = @ong.initiatives.find(params[:id])
    end

    def set_ong
      @ong = Ong.find(params[:ong_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def initiative_params
      params.require(:initiative).permit(:title, :description, :image, :active, :hashtag, :ong_id)
    end
end
