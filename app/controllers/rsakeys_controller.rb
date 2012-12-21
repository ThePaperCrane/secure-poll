class RsakeysController < ApplicationController
  include RSA
  
  def generate
    @rsakey = Rsakey.new
    
    keypair = KeyPair.generate(128)
    keypair_data = Marshal.dump(keypair)
    @rsakey.userid = current_user.id
    @rsakey.marshkey = keypair_data
    
    respond_to do |format|
      if @rsakey.save
        format.html {redirect_to root_path, notice: ("Key-pair was successfully generate. For your cryptology knowledge, here is your public key modulus and exponent: m = " + keypair.public_key.modulus.to_s + ", e = " + keypair.public_key.exponent.to_s)}
      else
        format.html {redirect_to root_path, notice: "Something went wrong, generate again."}
      end
    end
  end
  
  
  # GET /rsakeys
  # GET /rsakeys.json
  def index
    @rsakeys = Rsakey.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rsakeys }
    end
  end

  # GET /rsakeys/1
  # GET /rsakeys/1.json
  def show
    @rsakey = Rsakey.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rsakey }
    end
  end

  # GET /rsakeys/new
  # GET /rsakeys/new.json
  def new
    @rsakey = Rsakey.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rsakey }
    end
  end

  # GET /rsakeys/1/edit
  def edit
    @rsakey = Rsakey.find(params[:id])
  end

  # POST /rsakeys
  # POST /rsakeys.json
  def create
    @rsakey = Rsakey.new(params[:rsakey])

    respond_to do |format|
      if @rsakey.save
        format.html { redirect_to @rsakey, notice: 'Rsakey was successfully created.' }
        format.json { render json: @rsakey, status: :created, location: @rsakey }
      else
        format.html { render action: "new" }
        format.json { render json: @rsakey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rsakeys/1
  # PUT /rsakeys/1.json
  def update
    @rsakey = Rsakey.find(params[:id])

    respond_to do |format|
      if @rsakey.update_attributes(params[:rsakey])
        format.html { redirect_to @rsakey, notice: 'Rsakey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rsakey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rsakeys/1
  # DELETE /rsakeys/1.json
  def destroy
    @rsakey = Rsakey.find(params[:id])
    @rsakey.destroy

    respond_to do |format|
      format.html { redirect_to rsakeys_url }
      format.json { head :no_content }
    end
  end
end
