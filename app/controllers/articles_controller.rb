class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    # Creating a new article
    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    # Viewing the new article
    def create
        # render takes the hash of :plain and value of params[:article].inspect
        # The following will display the parameters passed
        # render plain: params[:article].inspect
        
        # Every rails model can be initialized with its respective attributes, which are automatically mapped to the respective columns.
        # Article was defined in app/model
        #
        # Get all parameters, put in @article
        #@article = Article.new(params[:article])
        
        # Get limitted parameters, put in @article
        @article = Article.new(article_params)
        
        # Returns false if validation fails
        if @article.save
            # Redirect to 'show' action
            redirect_to @article
        else
            # Pass params to 'new'.html.erb
            # in our case this is a simple reload
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
        
        if @article.update(article_params)
            # Redirect to 'show' action
            redirect_to @article
        else
            # Pass params to 'new'.html.erb
            # in our case this is a simple reload
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])

        @article.destroy

        redirect_to articles_path
    end

    private
        # Limit the params shown to the caller. If the user can get all the info back that would be very bad.
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
