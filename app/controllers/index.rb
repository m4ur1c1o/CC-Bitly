get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

post '/urls' do
  # crea una nueva Url
end

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
end