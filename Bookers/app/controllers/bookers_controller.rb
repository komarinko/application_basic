class BookersController < ApplicationController
  def top
  end

  def show
    @booker = Booker.find(params[:id])
  end

  def index
    @booker = Booker.new
    @bookers = Booker.all

  end

  def create
  	booker = Booker.new(booker_params)
  	booker.save
    flash[:success] = 'Book was successfully created.'
  	redirect_to booker_path(booker.id)
  end

  def edit
    @booker = Booker.find(params[:id])
  end

  def update
    booker = Booker.find(params[:id])
    booker.update(booker_params)
    flash[:success] = 'Book was successfully updated.'
    redirect_to booker_path(booker.id)
  end

  def destroy
    booker = Booker.find(params[:id])
    booker.destroy
    flash[:success] = 'Book was successfully destroyed.'
    redirect_to bookers_path
  end

  private
  def booker_params
  	params.require(:booker).permit(:title, :body)
  end
end
