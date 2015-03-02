class TagsController < ApplicationController
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

  def tag_params
    params.require(:tag).permit(:name, :description, :slug)
  end
end	
