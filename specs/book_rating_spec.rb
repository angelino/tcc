require_relative '../lib/book_rating'

describe BookRating do
  it 'should have a user id' do
    book_rating = BookRating.new(userid: '1234')
    book_rating.user_id.should == '1234'
  end

  it 'should have a book isbn' do
    book_rating = BookRating.new(isbn: '034545104X')
    book_rating.book_isbn.should == '034545104X'
  end

  it 'should have a book rating' do
    book_rating = BookRating.new(bookrating: '0')
    book_rating.book_rating.should == '0'
  end

  it 'should have all things' do
    data = { userid: '276745', isbn: '342310538', bookrating: '10' }
    book_rating = BookRating.new(data)

    book_rating.user_id.should == '276745'
    book_rating.book_isbn.should == '342310538'
    book_rating.book_rating.should == '10'
  end
end
