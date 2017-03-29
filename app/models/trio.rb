class Trio < ActiveRecord::Base
 belongs_to :word, :class_name => "Word"
 belongs_to :next, :class_name => "Word"
 belongs_to :previous, :class_name => "Word"
 
 
 
 def self.random

    #sprawdza czy słowo ma poprzednik i następnik
    #i czy nie są takie same
    #jeśli nie to losuje następne słowo
    while !@pair || !@prev || @pair == @prev
    offset = rand(Word.count)
    @word = Word.offset(offset).first
    #losowy następnik

    @pair = @word.seconds.order("RANDOM()").first
 
    @p = Pair.where(second_id: @word.id).order("RANDOM()").first
      if @p && Word.exists?(@p.word_id)
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
 
 
 
 
 
 
end
