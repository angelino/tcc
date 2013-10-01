require "euclidean_distance"

describe EuclideanDistance do

  it "returns a distance-based similarity score for person1 and person2" do
    ed = EuclideanDistance.new
    distance = ed.sim_distance(critics, 'Lisa Rose', 'Gene Seymour')

    distance.should be_within(1.0e-12).of(0.148148148148)
  end

  it "return 0 if they have no ratings in common" do
    ed = EuclideanDistance.new
    distance = ed.sim_distance(critics, 'Lisa Rose', 'Jhon')

    distance.should == 0
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
