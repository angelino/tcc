class Book
  attr_reader :isbn, :title, :author, :year_of_publication, :publisher

  def initialize(attributes)
    @isbn = attributes[:isbn]
    @title = attributes[:booktitle]
    @author = attributes[:bookauthor]
    @year_of_publication = attributes[:yearofpublication]
    @publisher = attributes[:publisher]
  end
end
