require_relative '../lib/books'

describe Books do
  it 'should have a filename' do
    books = Books.new('./specs/fixtures/books_sample.csv')
    books.filename.should == './specs/fixtures/books_sample.csv'
  end

  it 'should load data' do
    books = Books.new('./specs/fixtures/books_sample.csv')

    book = books.entries.last
    book.isbn.should == '0679425608'
    book.title.should == 'Under the Black Flag: The Romance and the Reality of Life Among the Pirates'
    book.author.should == 'David Cordingly'
    book.year_of_publication.should == '1996'
    book.publisher.should == 'Random House'
  end
end
