class FasesController < ApplicationController
  # GET /fases
  # GET /fases.xml
  def index
    @fases = Fase.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fases }
    end
  end

  # GET /fases/1
  # GET /fases/1.xml
  def show
    @fase = Fase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fase }
    end
  end

  # GET /fases/new
  # GET /fases/new.xml
  def new
    @fase = Fase.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fase }
    end
  end

  # GET /fases/1/edit
  def edit
    @fase = Fase.find(params[:id])
  end

  # POST /fases
  # POST /fases.xml
  def create
    @fase = Fase.new(params[:fase])

    respond_to do |format|
      if @fase.save
        format.html { redirect_to(@fase, :notice => 'Fase was successfully created.') }
        format.xml  { render :xml => @fase, :status => :created, :location => @fase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fases/1
  # PUT /fases/1.xml
  def update
    @fase = Fase.find(params[:id])

    respond_to do |format|
      if @fase.update_attributes(params[:fase])
        format.html { redirect_to(@fase, :notice => 'Fase was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fases/1
  # DELETE /fases/1.xml
  def destroy
    @fase = Fase.find(params[:id])
    @fase.destroy

    respond_to do |format|
      format.html { redirect_to(fases_url) }
      format.xml  { head :ok }
    end
  end
end
