require_relative 'pearson_correlation'
require_relative 'euclidean_distance'

class Recommendation
  attr_reader :preferences, :similarity

  def initialize(preferences, similarity)
    @preferences = preferences
    @similarity  = similarity
  end

  def recommendations_for(person)
    totals = Hash.new(0)
    sim_sums = Hash.new(0)

    preferences.each do |other, v|
      if other != person
        sim = similarity.sim_distance(preferences, person, other)

        if sim > 0
          preferences[other].each_key do |k|
            if (!preferences[person].has_key?(k)) || preferences[person][k] == 0
              totals[k]   += (preferences[other][k] * sim)
              sim_sums[k] += sim
            end
          end
        end
      end
    end

    # Create the normalized list
    rankings = []
    totals.each do |k, v|
      rankings << { k => (v / sim_sums[k]) }
    end

    # Return the sorted list
    sorted = rankings.sort_by { |r| r.values }

    reversed = []
    sorted.reverse_each do |s|
      reversed << s
    end

    reversed
  end
end

def critics
  # A dictionary of movie critics and their ratings of a small set of movies
  {
    'Lisa Rose' => {
      'Lady in the Water' => 2.5,
      'Snakes on a Plane' => 3.5,
      'Just My Luck' => 3.0,
      'Superman Returns' => 3.5,
      'You, Me and Dupree' => 2.5,
      'The Night Listener' => 3.0
    },
    'Gene Seymour' => {
      'Lady in the Water' => 3.0,
      'Snakes on a Plane' => 3.5,
      'Just My Luck' => 1.5,
      'Superman Returns' => 5.0,
      'The Night Listener' => 3.0,
      'You, Me and Dupree' => 3.5
    },
    'Michael Phillips' => {
      'Lady in the Water' => 2.5,
      'Snakes on a Plane' => 3.0,
      'Superman Returns' => 3.5,
      'The Night Listener' => 4.0
    },
    'Claudia Puig' => {
      'Snakes on a Plane' => 3.5,
      'Just My Luck' => 3.0,
      'The Night Listener' => 4.5,
      'Superman Returns' => 4.0,
      'You, Me and Dupree' => 2.5
    },
    'Mick LaSalle' => {
      'Lady in the Water' => 3.0,
      'Snakes on a Plane' => 4.0,
      'Just My Luck' => 2.0,
      'Superman Returns' => 3.0,
      'The Night Listener' => 3.0,
      'You, Me and Dupree' => 2.0
    },
    'Jack Matthews' => {
      'Lady in the Water' => 3.0,
      'Snakes on a Plane' => 4.0,
      'The Night Listener' => 3.0,
      'Superman Returns' => 5.0,
      'You, Me and Dupree' => 3.5
    },
    'Toby' => {
      'Snakes on a Plane' => 4.5,
      'You, Me and Dupree' => 1.0,
      'Superman Returns' => 4.0
    },
    'Jhon' => {}
  }
end

r = Recommendation.new(critics, PearsonCorrelation.new)
puts r.recommendations_for('Toby')

r = Recommendation.new(critics, EuclideanDistance.new)
puts r.recommendations_for('Toby')
