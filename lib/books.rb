require 'csv'

require_relative 'book'

class Books
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def entries
    @entries ||= build_books
  end

  private

  def build_books
    data.map { |row| Book.new(row) }
  end

  def data
    CSV.open(filename, 'r', encoding: 'cp1252', col_sep: ';', headers: true, header_converters: :symbol)
  end
end
