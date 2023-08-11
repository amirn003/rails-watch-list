class ListsController < ActionController::Base
  layout 'application'

  before_action :find_list, only: [:show]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_set)
    if @list.save
      redirect_to list_path(@list) #lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def params_set
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
