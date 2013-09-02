module PagesHelper
  
  def diff(id)
    @id = id
    
    if @id != @prev_id
      @prev_id = id
      return true
    else
      @prev_id = id
      return false
    end
    
  end
  
end
