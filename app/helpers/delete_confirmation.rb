def delete_confirmation
  if @display_delete_confirmation
    erb(:'_delete_confirm')
  end
end