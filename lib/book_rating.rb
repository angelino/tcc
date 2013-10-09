class BookRating
  attr_reader :user_id, :book_isbn, :book_rating

  def initialize(attributes)
    @user_id = attributes[:userid]
    @book_isbn = attributes[:isbn]
    @book_rating = attributes[:bookrating]
  end
end
