class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    # GET /
    # GET /posts
    def index
        @posts = Post.all
    end

    # GET /posts/:id
    def show
    end

    # GET /posts/new
    def new
        @post = Post.new
    end

    # POST /posts
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.save

        if @post.save
            redirect_to posts_path
        else
            redirect_to action: :new
        end
    end

    # GET /posts/:id/edit
    def edit 
    end

    # PATCH /posts/:id
    # PUT /posts/:id
    def update
        if @post.user_id == current_user.id
            if @post.update(post_params)
                redirect_to posts_path
            else
                render :edit
            end
        end
    end

    # DELETE /posts/:id
    def destroy
        if @post.user_id == current_user.id
            @post.destroy
            redirect_to posts_path, status: :see_other, notice: "投稿を削除しました。"
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :kind, :date_and_time, :content, :board_image, :board_image_cache, :place)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
