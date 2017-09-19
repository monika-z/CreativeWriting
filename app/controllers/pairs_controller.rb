class PairsController < ApplicationController
  before_action :set_pair, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:index, :show, :new, :edit, :update, :destroy]
  # GET /pairs
  # GET /pairs.json
  def index
    @pairs = Pair.all
  end

  # POST /pairs
  # POST /pairs.json
  def create
    @word = Word.find(params[:word_id])
    word = Word.find_or_create_by!(content: params[:pair][:second_id])
    @pair = @word.pairs.find_or_create_by!( second_id: word.id)
    @pair.strength += 1
    @pair.save
    redirect_to word_path(@word), notice: "Dziękujemy za dodanie skojarzenia!"
  end

  # PATCH/PUT /pairs/1
  # PATCH/PUT /pairs/1.json
  def update
    respond_to do |format|
      if @pair.update(pair_params)
        format.html { redirect_to @pair, notice: 'Pair was successfully updated.' }
        format.json { render :show, status: :ok, location: @pair }
      else
        format.html { render :edit }
        format.json { render json: @pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pairs/1
  # DELETE /pairs/1.json
  def destroy
    @pair.destroy
    respond_to do |format|
      format.html { redirect_to pairs_url, notice: 'Pair was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pair
      @pair = Pair.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pair_params
      params.require(:pair).permit(:second_id)
    end
end
