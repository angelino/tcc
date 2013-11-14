require_relative '../lib/users'
require_relative '../lib/books'
require_relative '../lib/book_ratings'

def data_hora_atual_formatada
  data_hora_atual = DateTime.now
  data_hora_atual.strftime("%d/%m/%Y - %H:%M:%S")
end

def log(mensagem)
  puts "#{data_hora_atual_formatada} - #{mensagem}"
end

log 'inicio da carga dos usuarios...'
users = Users.new('../data/BX-Users.csv')
users.entries.each do |user|
#   puts user
end
log 'final da carga dos usuarios...'

log 'inicio da carga dos livros...'
books = Books.new('../data/BX-Books.csv')
books.entries.each do |book|
#   puts book
end
log 'fim da carga dos livros...'

log 'inicio da carga das avaliacoes dos livros...'
book_ratings = BookRatings.new('../data/BX-Book-Ratings.csv')
book_ratings.entries.each do |book_rating|
#   puts book_rating
end
log 'fim da carga das avaliacoes dos livros...'



