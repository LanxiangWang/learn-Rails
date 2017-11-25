class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :show, :destroy]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
  def index
    @portfolio_items = Portfolio.by_position
  end

  def new
    @portfolio_item = Portfolio.new
    2.times { @portfolio_item.technologies.new }
  end

  def create
    @portfolio_items = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path, notice: 'portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update!(position: value[:position])
    end
    render nothing: true
  end

  def show

  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
    
  end

  def update

    respond_to do |format|
      if @portfolio_items.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy

    @portfolio_item.destroy
    respond_to do |format|
      format.html {redirect_to portfolios_path, notice: 'Portfolio was deleted.'}
    end
  end

  def set_portfolio_item
    @portfolio_items = Portfolio.find(params[:id])
  end
end
