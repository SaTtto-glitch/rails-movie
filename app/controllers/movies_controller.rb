class MoviesController < ApplicationController
    def index
      @movies = Movie.all
      if params[:is_showing].present?
        @movies = @movies.where(is_showing: params[:is_showing])
      end
      if params[:keyword].present?
        keyword = "%#{params[:keyword]}%"
        @movies = @movies.where("name LIKE ? OR description LIKE ?", keyword, keyword)
      end
    end
end