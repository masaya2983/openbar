class Public::GenresController < ApplicationController
  def search
    @model = params[:model]
		@content = params[:content]
    @liquors = Game.where(category_id: params[:category])
    render "public/searches/result"
  end
end
