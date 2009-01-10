class ChemicalsController < ApplicationController
  def index
    #@chemicals = Chemical.all
    #from will_paginate example
    #@posts = Post.paginate_by_board_id @board.id, :page => params[:page], :order => 'updated_at DESC'

    @chemicals = Chemical.paginate :page => params[:page], :order => 'name ASC'
    
    #@articles = Article.search params[:search], :include => :author, :match_mode => :boolean
    #@chemicals = Chemical.search params[:search], :match_mode => :boolean
    
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @items.to_xml }
      #csv code courtesy of Luke Francl http://railspikes.com/2007/5/8/uploads-with-respond_to
      format.csv {
            chemicals = Chemical.all
            csv = FasterCSV.generate do |csv|
              csv << ["Name", "CAS", "IUPAC Formula","SMILES", "InChI", "AMT", "QTY", "Location", "Storage", "Notes", "Supplier", "Catalog Number", "Date Entered"]
              chemicals.each do |item|
                csv << [item.name, item.cas, item.formula, item.smiles, item.inchi, item.amount, item.quantity, item.location, item.storage, item.notes, item.supplier, item.catalognumber, item.created_at]
              end
            end

            send_data(csv, :filename => 'chemicals.csv', 
                      :type => 'text/csv', :disposition => 'attachment')
          }
    end
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
