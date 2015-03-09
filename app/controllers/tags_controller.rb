class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

	def show
		@tag =Tag.find_by!(slug: params[:id])
	end	

  def new
    @tag = Tag.new
  end  

  def create
    @tag = Tag.new(tag_params)
    if @tag.valid?
      @tag.save
      redirect_to @tag
    else
      render :new
    end
  end

  def edit
    @tag = Tag.find_by!(slug: params[:id])
  end

  def update
    @tag = Tag.find_by!(slug: params[:id])
    if @tag.update(tag_params)
      redirect_to @tag
    else 
      render :edit
    end
  end

  def destroy
    @tag = Tag.find_by!(slug: params[:id])
    @tag.destroy
    redirect_to :action => "index"
  end

  def tag_params
    params.require(:tag).permit(:name, :description, :slug)
  end
end	
