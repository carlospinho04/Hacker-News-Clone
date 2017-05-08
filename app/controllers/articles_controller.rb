class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def edit
    if params[:check].to_i == 1
      @article = Article.find(params[:id])
      if Vote.where(:voter => current_user.name, :article_id => @article.id ).blank?
        @article.votes.create(:voter => current_user.name)
        votes = @article.up_votes + 1
        @article.update_attribute(:up_votes, votes)
        redirect_to '/'
      else
        redirect_to '/'
      end
    elsif params[:check].to_i == 2
      @article = Article.find(params[:id])
      if Vote.where(:voter => current_user.name, :article_id => @article.id ).blank?
        @article.votes.create(:voter => current_user.name)
        votes = @article.down_votes + 1
        @article.update_attribute(:down_votes, votes)
        redirect_to '/'
      else
        redirect_to '/'
      end
    end
  end

  def up
    @article = Article.find(params[:id])
    votes = @article.up_votes + 1
    @article.update_attribute(:up_votes, votes)
    redirect_to '/'
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:author, :up_votes, :down_votes, :title, :text)
  end

end
