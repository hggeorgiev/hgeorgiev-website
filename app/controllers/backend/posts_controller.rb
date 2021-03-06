class Backend::PostsController < Backend::ResourceController


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post created!"
      redirect_to backend_root_path
     else
      redirect_to new_backend_post_path
    end
  end

  def index
    @posts = Post.all
  end



  def destroy
     @post = Post.find(params[:id])
     @post.destroy
    redirect_to root_path
  end

  def show

    @post = Post.friendly.find(params[:id])
  end

  def edit
    @post = Post.friendly.find(params[:id])

  end

  def preview
    @description = params[:description]
   render :partial => 'preview', :content_type => 'text/html'
  end

  def update
   @post = Post.friendly.find(params[:id])
   @post.update_attributes(post_params)

   if @post.save
    flash[:notice] = "Post updated!"
    redirect_to backend_root_path
   else
    redirect_to new_backend_post_path
   end
  end

  private

  def post_params
    params.require(:post).permit( :title, :description , :all_tags)

  end
end
