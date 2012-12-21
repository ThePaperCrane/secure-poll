class PollsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /polls
  # GET /polls.json
  def index
    @polls = Poll.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @polls }
    end
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
    @poll = Poll.find(params[:id])
    a = @poll.option_a_score
    b = @poll.option_b_score
    @current_winner = nil
    if a > b
      @current_winner = :a
    elsif a < b
      @current_winner = :b
    else
      @current_winner = :tied
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @poll }
    end
  end

  # GET /polls/new
  # GET /polls/new.json
  def new
    @poll = Poll.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @poll }
    end
  end

  # GET /polls/1/edit
  def edit
    @poll = Poll.find(params[:id])
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(params[:poll])
    @poll.option_a_score = 0
    @poll.option_b_score = 0
    @poll.option_c_score = 0
    @poll.option_d_score = 0

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
        format.json { render json: @poll, status: :created, location: @poll }
      else
        format.html { render action: "new" }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /polls/1
  # PUT /polls/1.json
  def update
    @poll = Poll.find(params[:id])

    respond_to do |format|
      if @poll.update_attributes(params[:poll])
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @poll = Poll.find(params[:id])
    @poll.destroy

    respond_to do |format|
      format.html { redirect_to polls_url }
      format.json { head :no_content }
    end
  end
  
  def vote_a
    @poll = Poll.find(params[:id])
    if current_user != nil
      voted_array = Voted.find_all_by_userid(current_user.id)
      voted_on_poll_before = false
      if voted_array == []
        voted = Voted.new
        voted.userid = current_user.id
        voted.pollid = @poll.id
        
        if voted.save
          @poll.option_a_score += 1
        end
      else
        voted_array.each do |v|
          if v.pollid == @poll.id
            voted_on_poll_before = true
          end
        end
        if not voted_on_poll_before
          voted = Voted.new
          voted.userid = current_user.id
          voted.pollid = @poll.id

          if voted.save
            @poll.option_a_score += 1
          end
        end
      end
    end
    
    respond_to do |format|
      if @poll.update_attributes(params[:poll])
        format.html { redirect_to @poll, notice: 'Your vote was successful' }
        format.json { head :no_content }
      else
        format.html { redirect_to @poll, notice: 'Your vote was unsuccessful' }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def vote_b
    @poll = Poll.find(params[:id])
    if current_user != nil
      voted_array = Voted.find_all_by_userid(current_user.id)
      voted_on_poll_before = false
      if voted_array == []
        voted = Voted.new
        voted.userid = current_user.id
        voted.pollid = @poll.id
        
        if voted.save
          @poll.option_b_score += 1
        end
      else
        voted_array.each do |v|
          if v.pollid == @poll.id
            voted_on_poll_before = true
          end
        end
        if not voted_on_poll_before
          voted = Voted.new
          voted.userid = current_user.id
          voted.pollid = @poll.id

          if voted.save
            @poll.option_b_score += 1
          end
        end
      end
    end
    
    respond_to do |format|
      if @poll.update_attributes(params[:poll])
        format.html { redirect_to @poll, notice: 'Your vote was successful' }
        format.json { head :no_content }
      else
        format.html { redirect_to @poll, notice: 'Your vote was unsuccessful' }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # def vote_c
  #   @poll = Poll.find(params[:id])
  #   @poll.option_c_score += 1
  #   
  #   respond_to do |format|
  #     if @poll.update_attributes(params[:poll])
  #       format.html { redirect_to @poll, notice: 'Your vote was successful' }
  #       format.json { head :no_content }
  #     else
  #       format.html { redirect_to @poll, notice: 'Your vote was unsuccessful' }
  #       format.json { render json: @poll.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # 
  # def vote_d
  #   @poll = Poll.find(params[:id])
  #   @poll.option_d_score += 1
  #   
  #   respond_to do |format|
  #     if @poll.update_attributes(params[:poll])
  #       format.html { redirect_to @poll, notice: 'Your vote was successful' }
  #       format.json { head :no_content }
  #     else
  #       format.html { redirect_to @poll, notice: 'Your vote was unsuccessful' }
  #       format.json { render json: @poll.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  
end
