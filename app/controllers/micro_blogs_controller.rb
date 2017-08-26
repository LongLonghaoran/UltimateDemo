class MicroBlogsController < ApplicationController
  before_action :set_micro_blog, only: [:show, :edit, :update, :destroy]

  # GET /micro_blogs
  # GET /micro_blogs.json
  def index
    if params[:q].present?
      @micro_blogs = MicroBlog.search(params[:q])
    else
      @micro_blogs = MicroBlog.all
    end
  end

  # GET /micro_blogs/1
  # GET /micro_blogs/1.json
  def show
  end

  # GET /micro_blogs/new
  def new
    @micro_blog = MicroBlog.new
  end

  # GET /micro_blogs/1/edit
  def edit
  end

  # POST /micro_blogs
  # POST /micro_blogs.json
  def create
    @micro_blog = MicroBlog.new(micro_blog_params)

    respond_to do |format|
      if @micro_blog.save
        format.html { redirect_to @micro_blog, notice: 'Micro blog was successfully created.' }
        format.json { render :show, status: :created, location: @micro_blog }
      else
        format.html { render :new }
        format.json { render json: @micro_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /micro_blogs/1
  # PATCH/PUT /micro_blogs/1.json
  def update
    respond_to do |format|
      if @micro_blog.update(micro_blog_params)
        format.html { redirect_to @micro_blog, notice: 'Micro blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @micro_blog }
      else
        format.html { render :edit }
        format.json { render json: @micro_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /micro_blogs/1
  # DELETE /micro_blogs/1.json
  def destroy
    @micro_blog.destroy
    respond_to do |format|
      format.html { redirect_to micro_blogs_url, notice: 'Micro blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micro_blog
      @micro_blog = MicroBlog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micro_blog_params
      params.require(:micro_blog).permit(:title, :content)
    end
end
