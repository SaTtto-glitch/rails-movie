class Admin::MoviesController < ApplicationController
    def index
      @movies = Movie.all
    end

    def new
      @movie = Movie.new
    end
    
    def create
      @movie = Movie.new(movie_params)
    
      if @movie.save
        flash[:success] = '映画が登録されました。'
        redirect_to admin_movies_path
      else
        flash[:error] = '登録に失敗しました。'
        render :new
      end
    end

    def show
        @movie = Movie.find(params[:id])
    end
  
    def edit
        @movie = Movie.find(params[:id])
    end
  
    def update
        @movie = Movie.find(params[:id])
      if @movie.update(movie_params)
        redirect_to admin_movie_path(@movie)
      else
        render 'edit'
      end
    end

  
    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:success] = "Movie deleted"
        redirect_to admin_movies_path
    end

      
    private
  
    def movie_params
      params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
    end
      
    def set_movie
        @movie = Movie.find(params[:id])
    end
    
    def movie_params
        params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
    end




  end
  