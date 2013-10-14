class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_random, only: [:show, :new, :create]
  before_action :onetime, only: [:new]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.quiz = @odai

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @answer }
      else
        format.html { render action: 'new' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:contents, :user_id, :quiz_id)
    end

    def set_random
      if Quiz.count > 0
        random = Random.new((Date.today-Date.new(1970,1,1)).to_i)
        key = random.rand(Quiz.count)
        begin
          @odai = Quiz.all.offset(key).limit(1)[0]
          @answers = Answer.where(:quiz_id => @odai.id)
        rescue
          @odai = Quiz.new
          @answers = []
        end
      else
        @odai = Quiz.new
        @answers = []
      end
  end

  def onetime
    newestAnswer = @odai.answers.where(:user_id => 6).order('updated_at desc').limit(1)[0]
    if newestAnswer
      answerDate = newestAnswer.updated_at.to_date
      if ((Date.today() - answerDate).to_i == 0)
        redirect_to newestAnswer
      end
    end
  end
end
