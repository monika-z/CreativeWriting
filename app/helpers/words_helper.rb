module WordsHelper
    def word_pair(pair)
        "- #{Word.find(pair.second_id).content}" if Word.exists?(pair.second_id)
    end  
end
