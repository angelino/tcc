require 'csv'

class BookRating
  # attr_reader: user_id, book_isbn, rating

  def initialize(user_id, book_isbn, rating)
    @user_id = user_id
    @book_isbn = book_isbn
    @rating = rating
  end
end

class BookRatings
  def self.from_csv(filename)
    ratings = new

    contents = CSV.open(filename, 'r', col_sep: ';', headers: true, header_converters: :symbol)

    contents.each do |row|
      user_id = row[:userid]
      book_isbn = row[:isbn]
      book_rating = row[:bookrating]

      ratings.add_book_rating(BookRating.new(user_id, book_isbn, book_rating))

      puts "#{user_id} #{book_isbn} #{book_rating} Loaded from csv file..."
    end
  end

  def initialize
    @ratings = []
  end

  def add_book_rating(rating)
    @ratings << rating
  end

  def get_ratings_by_user_id(user_id)
    @ratings.select { |r| r.user_id == user_id }
  end
end

ratings = BookRatings.from_csv('sample.csv')

ratings.get_ratings_by_user_id(276729)

# {
#   user_id => {
#     book_isbn => book_rating,
#     book_isbn => book_rating,
#     book_isbn => book_rating
#   },
#   user_id => {
#     book_isbn => book_rating,
#     book_isbn => book_rating,
#     book_isbn => book_rating
#   },
#   user_id => {
#     book_isbn => book_rating,
#     book_isbn => book_rating,
#     book_isbn => book_rating
#   }
# }

