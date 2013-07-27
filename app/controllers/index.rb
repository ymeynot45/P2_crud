#Left to do:
# (Stretch) Add AJAX and Partials to convert your page to a single page application.
# Sinatra doesn't support put or delete without middleware and  Rack::MethodOverride


get '/' do
  if Note.all && Note.all.count > 0
    @notes = Note.all
  end
  @display_delete_confirmation = false
  erb :index
end

get '/note/delete/:id' do
  @notes = []
  @notes << Note.find_by_id(params[:id])
  @display_delete_confirmation = true
  erb :index
end

get '/note/:id' do
  @note = Note.find_by_id(params[:id])
  @display_delete_confirmation = false
  erb :show
end

post '/delete/:id' do
  if params[:response] == 'Delete'
    note = Note.find_by_id(params[:id])
    note.destroy
  end
  redirect to '/'
end

post '/notes/' do
  note = Note.new(params[:note])
  if note.valid?
    note.save
    redirect to '/'
  else
    @errors = note.errors.messages
    erb :index
  end
end

post '/note/update' do
  puts params
  Note.update(params[:note][:id].to_i, :title => params[:note][:title], :content => params[:note][:content])
  @note = Note.find_by_id(params[:note][:id])
  erb :show
end

