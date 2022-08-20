class ListsController < ApplicationController
  before_action :set_list, only: :show

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.valid?
      @list.save
      redirect_to lists_path(@list)
    else
      render :new
    end
  end

  def show
    @bookmark = Bookmark.new

  end


  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end

end
