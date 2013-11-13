require_relative '../lib/book'

describe Book do
  it 'should have an isbn' do
    book = Book.new(isbn: '0195153448')
    book.isbn.should == '0195153448'
  end

  it 'should have a title' do
    book = Book.new(booktitle: 'Classical Mythology')
    book.title.should == 'Classical Mythology'
  end

  it 'should have an author' do
    book = Book.new(bookauthor: 'Mark P. O. Morford')
    book.author.should == 'Mark P. O. Morford'
  end

  it 'should have a year of publication' do
    book = Book.new(yearofpublication: '2002')
    book.year_of_publication.should == '2002'
  end

  it 'should have a publisher' do
    book = Book.new(publisher: 'Oxford University Press')
    book.publisher.should == 'Oxford University Press'
  end

  it 'should have all things' do
    data = { isbn: '0195153448', booktitle: 'Classical Mythology', bookauthor: 'Mark P. O. Morford', yearofpublication: '2002', publisher: 'Oxford University Press' }
    book = Book.new(data)

    book.isbn.should == '0195153448'
    book.title.should == 'Classical Mythology'
    book.author.should == 'Mark P. O. Morford'
    book.year_of_publication.should == '2002'
    book.publisher.should == 'Oxford University Press'
  end
end
