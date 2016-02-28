class MoviesController < ApplicationController
   def index
     render json: {
       meta: {
         count: Movie.count,
         page: 0
       },
       movies: Movie.order(id: :asc)
     }
   end
   def create
        if movie = Movie.create(movie_params)
          render json: { movie: movie }
        else
          render json: {
            message: "Could not create Movie",
            errors: movie.errors,
          }, status: :unprocessible_entity
        end
      end

      def update
        movie = Movie.find(params[:id])

        if movie.update(movie_params)
          render json: { movie: movie }
        else
          render json: {
            message: "Could not update Movie",
            errors: movie.errors,
          }, status: :unprocessible_entity
        end
      end

      def destroy
        movie = Movie.find(params[:id])

        if movie.destroy
          render json: { movie: nil }
        else
          render json: {
            message: "Could not destroy Movie, please try again",
          }, status: :unprocessible_entity
        end
      end

      private

      def movie_params
        params.require(:movie).permit(:title, :completed)
      end



 end
