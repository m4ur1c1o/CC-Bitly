get '/' do
  # Deja a los usuarios crear una URL reducida 
  # y despliega una lista de URLs.
  @url_list = Url.all
  erb :url
  # erb :index
end

post '/urls' do
  original_url = params[:url]
  Url.create(original_url: original_url)
  redirect to('/')
end

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
  corto = params[:short_url]
  tuple = Url.find_by(short_url: corto)
  puts "La cuenta es: #{tuple.click_count}"
  # puts "la tupla es: #{tuple.original_url}"
  # tuple.update(click_count: )
  tuple.click_count += 1
  tuple.save!
  real_url = tuple.original_url
  puts real_url
  redirect to("#{real_url}")
end