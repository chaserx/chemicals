class Chemical < ActiveRecord::Base

  #thinking_sphinx 
  define_index do
    indexes name
    indexes cas
    indexes formula
    indexes location
    indexes storage
    indexes notes
    indexes smiles
    indexes inchi
    
    has created_at
  end
  
  #paperclip
  has_attached_file :msds

end
