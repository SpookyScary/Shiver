class WritingsController < ApplicationController
    before_action :set_writing, only: [:show, :edit, :update, :destroy]
    before_action :set_member
    before_action :check_author, only: [:edit, :update, :destroy]
    def index
        @writings=Writing.all
    end
    
    def new
        @writing = Writing.new
    end
    def create
        @writing = Writing.new(writing_params)
        @writing.member=@current_member
        if @writing.save
            redirect_to writings_path
            flash[:yes]="Story Succesfully Created!"
        else
            render :new
        end
    end
    
    def show
    @writings=Writing.all.to_a
    @random_writing = @writings.sample
     if not @writing.nil?
      @time=((@writing.text.scan(/\w+/).size)/200.to_f).ceil
     end
    end
    
    private
    
    def writing_params
        params.require(:writing).permit(:title, :text, :member_id)
    end
    
    def set_writing
        @writing=Writing.find(params[:id])
    end
    
    def set_member
        if @current_member
            true
        else
            redirect_to '/fail'
            flash[:denied] = 'Members'
        end
    end
    
    def check_author
        if @writing.member = @current_member
            true
        else
            redirect_to '/fail'
            flash[:denied] = "the author of this story"
        end
    end
end
