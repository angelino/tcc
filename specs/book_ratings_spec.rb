require_relative '../lib/book_ratings'

describe BookRatings do
  it 'should have a filename' do
    book_ratings = BookRatings.new('./specs/fixtures/book_ratings_sample.csv')
    book_ratings.filename.should == './specs/fixtures/book_ratings_sample.csv'
  end

  it 'should load data' do
    book_ratings = BookRatings.new('./specs/fixtures/book_ratings_sample.csv')

    book_rating = book_ratings.entries.last
    book_rating.user_id.should == '276745'
    book_rating.book_isbn.should == '342310538'
    book_rating.book_rating.should == '10'
  end
end
