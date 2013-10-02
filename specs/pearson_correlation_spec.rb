require_relative '../lib/pearson_correlation'
require_relative '../data/movie_critics'

describe PearsonCorrelation do

  it "returns a distance-based similarity score for person1 and person2" do
    pearson = PearsonCorrelation.new
    distance = pearson.sim_distance(MovieCritics.ratings, 'Lisa Rose', 'Gene Seymour')

    distance.should be_within(1.0e-12).of(0.396059017191)
  end

  it "return 0 if they have no ratings in common" do
    pearson = PearsonCorrelation.new
    distance = pearson.sim_distance(MovieCritics.ratings, 'Lisa Rose', 'Jhon')

    distance.should == 0
  end

end
