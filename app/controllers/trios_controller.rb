class TriosController < ApplicationController
  before_action :set_trio, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:index, :show, :new, :edit, :update, :destroy]
  # GET /trios
  # GET /trios.json
  def index
    @trios = Trio.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  # GET /trios/1
  # GET /trios/1.json
  def show
  end

  # GET /trios/new
  def new
    @trio = Trio.new
  end

  # GET /trios/1/edit
  def edit
  end


def random

    #sprawdza czy słowo ma poprzednik i następnik
    #i czy nie są takie same
    #jeśli nie to losuje następne słowo
    while !@pair || !@prev || @pair == @prev
    offset = rand(Word.count)
    @word = Word.offset(offset).first
    #losowy następnik

    @pair = @word.seconds.order("RANDOM()").first
 
    @p = Pair.where(second_id: @word.id).order("RANDOM()").first
      if @p
        @prev = Word.find(@p.word_id)
      else
        @prev = 0
      end
    end

    #znajduje następnik następnika 
    #(lub jeśli nie ma, zostawia pierwszy)
    if @pair
      if @pair.seconds.first
        @nexts = @pair.seconds.order("RANDOM()").first
        #sprawdza czy nie powtarza sie z głównym słowem
        if @nexts == @word
          if @pair.seconds.second
            @nexts = @pair.seconds.second
          else
            @nexts = @pair
          end  
        end
      else
        @nexts = @pair
      end
    end

    #znajduje poprzednik poprzednika
    if @prev
      r = Pair.where(second_id: @prev.id).order("RANDOM()")
      if r.length > 0
        @prevs = Word.find(r.first.word_id)
        if @prevs == @word
          if r.second
            @prevs = Word.find(r.second.word_id)
          else
            @prevs = @prev
          end
        end  
      else
        @prevs = @prev
      end
    end
    @trio = Trio.new
    @trio.word_id = @word.id
    @trio.next_id = @nexts.id
    @trio.previous_id = @prevs.id
    @trio.save
  end





  # POST /trios
  # POST /trios.json
  def create
    @trio = Trio.new(trio_params)

    respond_to do |format|
      if @trio.save
        format.html { redirect_to @trio, notice: 'Utworzono słowa dnia' }
        format.json { render :show, status: :created, location: @trio }
      else
        format.html { render :new }
        format.json { render json: @trio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trios/1
  # PATCH/PUT /trios/1.json
  def update
    respond_to do |format|
      if @trio.update(trio_params)
        format.html { redirect_to @trio, notice: 'Zauktualizowano.' }
        format.json { render :show, status: :ok, location: @trio }
      else
        format.html { render :edit }
        format.json { render json: @trio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trios/1
  # DELETE /trios/1.json
  def destroy
    @trio.destroy
    respond_to do |format|
      format.html { redirect_to trios_url, notice: 'Wybrane słowa dnia zostały usunięte' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trio
      @trio = Trio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trio_params
      params.require(:trio).permit(:first_id, :second_id, :third_id)
    end
end
