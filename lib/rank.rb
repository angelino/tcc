require_relative 'euclidean_distance'

class Rank
  attr_reader :similarity

  def initialize(similarity_metric)
    @similarity = similarity_metric
  end

  def top_matches(prefs, person, n=5)
    scores = []

    prefs.each do |k, v|
      if k != person
        scores << similarity.sim_distance(prefs, person, k)
      end
    end

    puts scores
    sorted = scores.sort

    reverse = []
    sorted.reverse_each do |s|
      reverse << s
    end

    reverse[0...n]
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

rank = Rank.new(EuclideanDistance.new)

scores = rank.top_matches(critics, 'Toby', 3)

puts scores
