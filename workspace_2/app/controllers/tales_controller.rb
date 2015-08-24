class TalesController < ApplicationController
  before_action :set_tale, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :edit, :update, :destroy]
 # before_action :authenticate, only: [:new]
  # GET /tales
  # GET /tales.json
  def index
    @tales = Tale.search(params[:search])
    @random_tale = @tales.sample
  end
  def new
    @tale=Tale.new
  end
  def all
    if params[:search] && params[:filter]
      @result = Tale.search(params[:search])
      case params[:filter]
      when 'most recent'
        @tales=@result.recently_added
      when 'longest'
        @tales=@result.sort{|x,y| y.text.length <=> x.text.length}
      when 'shortest'
        @tales=@result.sort{|x,y| x.text.length <=> y.text.length}
      else
        @tales=Tale.search(params[:search])
      end
    elsif params[:search]
      if params[:search]==""
        @tales=Tale.all
      else
     @tales = Tale.search(params[:search])
      end
    else
     @tales = Tale.all
     @label = 'All Stories'
    end
  end
  
  def recently_added
    @tales = Tale.recently_added
    @label = 'Recently Added'
    render 'all'
  end
  def oldest
    @tales = Tale.oldest
    @label = 'Oldest Entries'
    render 'all'
  end
  
  def longest
    @all = Tale.all
    @label = 'Longest to Shortest'
    @tales = @all.sort{|x,y| y.text.length <=> x.text.length}
    render 'all'
  end
  def shortest
    @all = Tale.all
    @label = 'Shortest to Longest'
    @tales = @all.sort{|x,y| x.text.length <=> y.text.length}
    render 'all'
  end

  # GET /tales/1
  # GET /tales/1.json
  def show
    @tales=Tale.all.to_a
    @random_tale = @tales.sample
    if not @tale.nil?
      @time=((@tale.text.scan(/\w+/).size)/200.to_f).ceil
    end
  end
  
  # GET /tales/1/edit
  def edit
  end

  # POST /tales
  # POST /tales.json
  def create
    @tale = Tale.new(tale_params)

    respond_to do |format|
      if @tale.save
        format.html { redirect_to '/all', notice: 'Tale was successfully created.' }
        format.json { render :show, status: :created, location: @tale }
      else
        format.html { render :new }
        format.json { render json: @tale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tales/1
  # PATCH/PUT /tales/1.json
  def update
    respond_to do |format|
      if @tale.update(tale_params)
        format.html { redirect_to @tale, notice: 'Tale was successfully updated.' }
        format.json { render :show, status: :ok, location: @tale }
      else
        format.html { render :edit }
        format.json { render json: @tale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tales/1
  # DELETE /tales/1.json
  def byebyebye
    @tale.destroy
    respond_to do |format|
      format.html { redirect_to tales_url, notice: 'Tale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def fail
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tale
      if params[:id]!='all'
      @tale = Tale.find(params[:id])
      else
        redirect_to '/all?search='+params[:search]
      end
    end
    def check_admin
      if @current_member
        if @current_member.admin
          true
        end
      else
        redirect_to '/fail'
        flash[:denied]="Admins"
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def tale_params
      params.require(:tale).permit(:title, :text, :image, :book, :author)
    end
end
