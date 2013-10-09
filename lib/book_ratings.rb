require 'csv'

require_relative 'book_rating'

class BookRatings
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def entries
    @entries ||= build_book_ratings
  end

  private

  def build_book_ratings
    data.map { |row| BookRating.new(row) }
  end

  def data
    CSV.open(filename, 'r', col_sep: ';', headers: true, header_converters: :symbol)
  end
end
