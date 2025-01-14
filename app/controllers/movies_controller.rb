class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = ['G','PG','PG-13','R']

    #@movies = Movie.where(rating: @all_ratings)
    @rating_choices = @all_ratings
    if params.has_key?("ratings")==false && session.has_key?("ratings")
        @rating_choices = session["ratings"]
        params["ratings"] = session["ratings"]
        if params.has_key?("sort") && session.has_key?("sort")==false
            redirect_to movies_path(utf8:session["utf8"], sort: params["sort"], ratings: session["ratings"])
        end
        #return

#         if params.has_key?("sort") && session.has_key?("sort")
#             redirect_to movies_path(utf8:session["ut-tags"], sort: session["sort"], ratings: session["ratings"])
#         end
#         if params.has_key("sort")==false && session.has_key?("sort")
#             redirect_to movies_path(utf8:session["ut-tags"], sort: session["sort"], ratings: session["ratings"])
#         end
#         if params.has_key("sort")==false && session.has_key?("sort")==false
#             redirect_to movies_path(utf8:session["ut-tags"], ratings: session["ratings"])
#         end
        #return
    end

    if params.has_key?("sort")==false && session.has_key?("sort")
       params["sort"] = session["sort"]
       if params.has_key?("ratings") && session.has_key?("ratings")==false
           redirect_to movies_path(sort: params["sort"], ratings: params["ratings"])
       end
       #return
    end

    if params.has_key?("ratings")
        @rating_choices = params["ratings"].keys
        session["ratings"] = params["ratings"]
        session["utf8"] = params["utf8"]
    end
    @movies = Movie.where(rating: @rating_choices)
    if params.has_key?("sort")
        @movies = @movies.order(params["sort"])
        session["sort"] = params["sort"]
    end
#     if params.has_key?("ratings")==false && params.has_key?("sort")==false && session.has_key?("ratings")==false and session.has_key?("sort")==false
#         @movie = Movie.all
#     end


#     if params.has_key?("ratings")==false && session.has_key?("ratings")
#         @rating_choices = session["ratings"]
#         params["ratings"] = session["ratings"]
#         if params.has_key?("sort") && session.has_key?("sort")==false
#             redirect_to movies_path(utf8:session["utf8"], sort: params["sort"], ratings: session["ratings"])
#         end
#         return
#
# #         if params.has_key?("sort") && session.has_key?("sort")
# #             redirect_to movies_path(utf8:session["ut-tags"], sort: session["sort"], ratings: session["ratings"])
# #         end
# #         if params.has_key("sort")==false && session.has_key?("sort")
# #             redirect_to movies_path(utf8:session["ut-tags"], sort: session["sort"], ratings: session["ratings"])
# #         end
# #         if params.has_key("sort")==false && session.has_key?("sort")==false
# #             redirect_to movies_path(utf8:session["ut-tags"], ratings: session["ratings"])
# #         end
#         #return
#     end

#     if params.has_key?("sort")==false && session.has_key?("sort")
#        params["sort"] = session["sort"]
#        if params.has_key?("ratings") && session.has_key?("ratings")==false
#            redirect_to movies_path(sort: params["sort"], ratings: params["ratings"])
#        end
#        return
#     end
#
#     if params.has_key?("ratings") && params.has_key?("sort")
#         puts("problem 3")
#         @movies = Movie.order(params["sort"])
#         @movies = @movies.where(rating: params["ratings"].keys)
#     end
#
#     if params.has_key?("ratings")==false && params.has_key?("sort")
#         puts("problem 2")
#         @movies = Movie.order(params["sort"])
#         #@movies = @movies.where(rating: params["ratings"].keys)
#     end
#
#     if params.has_key?("ratings") && params.has_key?("sort")==false
#         puts("problem 1")
#         @movies = Movie.where(rating:params["ratings"].keys)
#             #@movies = @movies.where(rating: params["ratings"].keys)
#     end
#
#     if params.has_key?("ratings")==false && params.has_key?("sort")==false
#         @movies = Movie.all
#     end

#     if params.has_key?("ratings")
#         @rating_choices = params["ratings"].keys
#         session["ratings"] = params["ratings"]
#         session["utf8"] = params["utf8"]
#         puts(session["ratings"])
#         puts(session["utf8"])
#         if session.has_key?("sort")
#             params["sort"] = session["sort"]
#             redirect_to movies_path(ratings: params["ratings"], sort:params["sort"])
#         else
#            redirect_to movies_path(ratings: params["ratings"])
#         end
#         return
#     end
#     #@movies = Movie.where(rating: @rating_choices)
#     if params.has_key?("sort")
#         #@movies = @movies.order(params["sort"])
#         session["sort"] = params["sort"]
#         if session.has_key?("ratings")
#             params["utf8"] = session["utf8"]
#             redirect_to movies_path(ratings: params["ratings"], sort: params["sort"])
#         else
#             redirect_to movies_path(sort: params["sort"])
#         end
#         return
#     end


    #puts(@movies)
    #puts(params.keys)
    #puts(session.keys)

#     if params.has_key?("ratings")==false && session.has_key?("ratings"):
#         @rating_choices = session["ratings"].keys
#         @movies = @movies.where(rating: rating_choices)
#         if params.has_key?("sort") && session.has_key?("sort")==false
#             redirect_to movies_path(utf8:session["ut-tags"], sort: params["sort"], ratings: session["ratings"])
#         end
#         if params.has_key?("sort") && session.has_key?("sort")
#             redirect_to movies_path(utf8:session["ut-tags"], sort: session["sort"], ratings: session["ratings"])
#         end
#         if params.has_key("sort")==false && session.has_key?("sort")
#             redirect_to movies_path(utf8:session["ut-tags"], sort: session["sort"], ratings: session["ratings"])
#         end
#         if params.has_key("sort")==false && session.has_key?("sort")==false
#             redirect_to movies_path(utf8:session["ut-tags"], ratings: session["ratings"])
#         end
#         return
#     end
#     if params.has_key?("sort")==false && session.has_key?("sort"):
#         @movies = Movie.order(rating:params["sort"])
#         params["sort"] = session["sort"]
#         if params.has_key?("ratings") && session.has_key?("ratings")==false:
#             redirect_to movies_path(sort: session["sort"], rating: para)
#         end
# #         if params.has_key?("ratings")==false && session.has_key?("ratings")
# #             redirect_to movies_path(utf8:session["ut-tags"], sort: session["sort"], ratings: session["ratings"])
# #         end
# #         if params.has_key?("ratings")==false && session.has_key?("ratings")==false
# #             redirect_to movies_path(sort: session["sort"])
# #         end
# #         if params.has_key?("ratings") && session.has_key?("ratings")
# #             redirect_to movies_path(utf8:session["ut-tags"], sort: session["sort"], ratings: session["ratings"])
# #         end
#         return
    end

    if params.has_key?("ratings")==false && session.has_key?("ratings")
        @rating_choices = session["ratings"]
        params["ratings"] = session["ratings"]
    end
    if params.has_key?("sort")
        @movies = Movie.order(params["sort"])
    end
    if params.has_key?("ratings")
        @rating_choices = params['ratings'].keys
        session["ratings"] = @rating_choices
    end
    @movies = Movie.where(rating: @rating_choices)
    redirect_to movies_path(sort: session["sort"])
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
