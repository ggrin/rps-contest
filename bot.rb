class Bot

  include Judge

  def name
    self.class.name
  end

  def choose
    raise "Implement choose, dude!"
  end

  def learn(choice, opponents_choice)
    raise "Implement learn(choice, opponents_choice), dude!"
  end

  def choose_to_beat(choice)
    CHOICE_MAP.each_pair.select { |pair|
      pair[1] == choice
    }.first.first
  end
  def random_choice
    CHOICES[rand(CHOICES.length)]
  end

end
