class Api::V1::ArticlesController < ApplicationController
    def index
        # random
        # search term
        # alpha paginated
        # recent edits
        # user created
        # user contributed
    end

    def show
        @article = Article.find(params[:id])
        render json: @article
    end

    def create
        @existing = Article.find_by(title: article_create_params[:title])
        if @existing
            render json: { error: 'Article with that Title already exists' , status: 400, article: @existing }, status: 400
            return
        end

        ActiveRecord::Base.transaction do
            begin
                @article = Article.new(article_create_params)
                if @article.save
                    p "current_user", current_user
                    @edit = Edit.new(user: current_user, edit_type: 'article-create', article: @article)
                    @edit.save!

                    render json: @article
                else
                    render json: { error: 'Unable to create Article' }, status: 400
                end
            rescue
                render json: { error: 'Unable to create Edit record; will not create Article' }, status: 400
                raise
            end
        end
    end

    def update
    end

    def article_create_params
        @create_params ||= params.require(:article).permit(:title)
    end
end
