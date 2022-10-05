class ListsController < ApplicationController
  def new
  end

  def index
    @list = List.new
    @lists = List.all
  end
  
  def create
    @list = List.new(list_params)
    if @list.save
    redirect_to list_path(@list.id)
    else
    @lists = List.all
    render :index
    end
    if @list.save
      flash[:notice] = "Book was successfully created."
    end
  end
  
  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to list_path(@list.id)
    else

    render :edit
    end  
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/books'
    if list.destroy
    flash[:notice] = "Book was successfully destroyed."
    end
  end
  
  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
