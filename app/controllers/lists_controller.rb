class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: @list.id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_url(@list)
    else
      render :new
    end
  end

  # def update
  #   if @list.update(list_params)
  #     redirect_to list_url(@list)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @list.destroy
  #   redirect_to lists_url
  # end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
