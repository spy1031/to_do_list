class ListsController < ApplicationController
  before_action :set_list,  :only=>[:edit,:update,:destroy,:show]
  before_action :set_lists
  def index
    @list = List.new

    @today = Date.today
  end



  def create
    
    @list = List.new(list_params)
    @today = Date.today
    @list.save
    if @list.due_date > @today
      render  :action =>  :index
      return
    end

    
    if @list.save 
      redirect_to lists_url
    else
      render  :action =>  :index
    end
   
  end 

  def update
    
    if @list.update_attributes(list_params)
      redirect_to lists_url
    else
      render  :action =>  :edit
    end
    
  end

  def destroy
    @list.destroy   
    redirect_to lists_url
  end
  private
  def set_list
    @list = List.find(params[:id])
  end

  def set_lists
    @lists = List.all
    
  end
  def list_params
    params.require(:list).permit(:title, :due_date, :note)
  end


end
