class HistoriasController < ApplicationController
  # GET /historias
  # GET /historias.xml
  def index
    @historias = Historia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @historias }
    end
  end

  # GET /historias/1
  # GET /historias/1.xml
  def show
    @historia = Historia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @historia }
    end
  end

  # GET /historias/new
  # GET /historias/new.xml
  def new
    @historia = Historia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @historia }
    end
  end

  # GET /historias/1/edit
  def edit
    @historia = Historia.find(params[:id])
  end

  # POST /historias
  # POST /historias.xml
  def create
    @historia = Historia.new(params[:historia])

    respond_to do |format|
      if @historia.save
        format.html { redirect_to(@historia, :notice => 'Historia was successfully created.') }
        format.xml  { render :xml => @historia, :status => :created, :location => @historia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @historia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /historias/1
  # PUT /historias/1.xml
  def update
    @historia = Historia.find(params[:id])

    respond_to do |format|
      if @historia.update_attributes(params[:historia])
        format.html { redirect_to(@historia, :notice => 'Historia was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @historia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /historias/1
  # DELETE /historias/1.xml
  def destroy
    @historia = Historia.find(params[:id])
    @historia.destroy

    respond_to do |format|
      format.html { redirect_to(historias_url) }
      format.xml  { head :ok }
    end
  end
end
