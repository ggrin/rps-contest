class MarkovBot < Bot

  def reset
    @rounds = 0
    @wins = 1
    @ngrams = Hash.new(Hash.new(0))
    @choices = ["a","b","c"]
  end
  alias initialize reset

  def choices
    return @choices.join(' ')
  end

  def learn a, b
    @rounds+=1
    @wins += 1 if judge(a,b) == 1
    
    if @rounds > 3
      @ngrams[choices][b]+=1
    end
    @choices = @choices[1..-1].push "#{a}:#{b}"
  end
  def total
    tot=0
    @ngrams[choices].each_pair{|k, v|
      tot+=v
    }
    tot
  end

  def choose
    return  random_choice if @rounds < 10
    num = rand*total
    tot = 0
    @ngrams[choices].each_pair{|k, v|
      tot += v
      return choose_to_beat(k)  if tot > num
    }
    puts @ngrams
    return random_choice
  end
  def performance
     @wins.to_f/@rounds.to_f
  end
end
