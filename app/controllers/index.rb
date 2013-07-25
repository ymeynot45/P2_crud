get '/' do
  if Note.all && Note.all.count > 0
    @notes = Note.all
  end
  erb :index
end

get '/note/show/:id' do
  @note = Note.find_by_id(params[:id])
  erb :show
end


post '/notes/create' do
  puts params
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