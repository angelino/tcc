require 'csv'

require_relative 'user'

class Users
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def entries
    @entries ||= build_users
  end

  private

  def build_users
    data.map { |row| User.new(row) }
  end

  def data
    CSV.open(filename, 'r', encoding: 'cp1252', col_sep: ';', headers: true, header_converters: :symbol)
  end
end
