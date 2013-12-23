class EntriesController < ApplicationController

  def index
    @entries = Entry.order(created_at: :desc)
  end

  def show
    @entry = Entry.find_by(id: params[:id])
  end

  def new
    @entry = Entry.new
  end


  def create
    @entry = Entry.new(entry_params)
    @category = Category.find_by(id: params[:entry][:category_id])

    @entry.category = @category
    if @entry.save
      redirect_to @entry, notice: 'Entry was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @entry = Entry.find_by(id: params[:id])
  end

  def update
    @entry = Entry.find_by(id: params[:id])
    if @entry.update(entry_params)
      redirect_to @entry, notice: 'Entry was update!!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @entry = Entry.find_by(id: params[:id])
    @entry.destroy
    redirect_to entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description)
  end
end
