class ChemicalsController < ApplicationController
  def index
    @chemicals = Chemical.all
  end
  
  def show
    @chemical = Chemical.find(params[:id])
  end
  
  def new
    @chemical = Chemical.new
  end
  
  def create
    @chemical = Chemical.new(params[:chemical])
    if @chemical.save
      flash[:notice] = "Successfully created chemical."
      redirect_to @chemical
    else
      render :action => 'new'
    end
  end
  
  def edit
    @chemical = Chemical.find(params[:id])
  end
  
  def update
    @chemical = Chemical.find(params[:id])
    if @chemical.update_attributes(params[:chemical])
      flash[:notice] = "Successfully updated chemical."
      redirect_to @chemical
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @chemical = Chemical.find(params[:id])
    @chemical.destroy
    flash[:notice] = "Successfully destroyed chemical."
    redirect_to chemicals_url
  end
end
