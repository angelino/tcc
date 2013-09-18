class PearsonCorrelation
  def sim_distance(prefs, person1, person2)
    shared_items = {}

    prefs[person1].each do |k, v|
      shared_items[k] = 1 if prefs[person2][k]
    end

    # if they have no ratings in common, return 0
    return 0 if shared_items.size == 0

    # Add up all the preferences
    sum1 = 0
    prefs[person1].each do |k, v|
      puts "#{self.class} - CHAVE - #{k}"
      puts "#{self.class} - VALOR - #{v}"
      sum1 += v
    end
    puts sum1

    sum2 = 0
    prefs[person2].each do |k, v|
      puts "#{self.class} - CHAVE - #{k}"
      puts "#{self.class} - VALOR - #{v}"
      sum2 += v
    end
    puts sum2
  end
end
