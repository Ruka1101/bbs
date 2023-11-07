class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :destroy]

    # GET /posts
    # POSt /posts
    def index
        @posts = Post.all
    end

    # GET /posts/:id/edit
    def new
        @post = Post.new
    end

    # GET /posts/new
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.save

        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    # PATCH /posts/:id
    def edit 
    end

    # PUT /posts/:id
    # DELETE /posts/:id
    def update
        if @post.user_id == current_user.id
            if @post.update(post_params)
                redirect_to posts_path
            else
                render :edit
            end
        else
            redirect_to posts_path, notice: "編集権限がありません。"
        end
    end

    def destroy
        if @post.user_id == current_user.id
            @post.destroy
            redirect_to posts_path
        else
            redirect_to posts_path, notice: "削除権限がありません。"
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :content)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
