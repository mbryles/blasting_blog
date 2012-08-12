class PostsController < ApplicationController
  
  http_basic_authenticate_with :name => "markbryles", :password => "secret", :except => [:index, :show]
  
  def new
     @post = Post.new
  end
  def create  
    @post = Post.new(params[:post])  
  
    respond_to do |format|  
      if @post.save  
        format.html { redirect_to(@post, :notice => 'Post created.') }  
        format.js  
      else  
        format.html { render :action => "new" }  
        format.js  
      end  
    end  
end  
  def create2
    @post = Post.new(params[:post])
    
    if @post.save
      #redirect_to :action => :show, :id => @post.id
        format.html { redirect_to(@post, :notice => 'Post created.') }
        format.js
    else
      #render 'new'
        format.html { render :action => "new" }
        format.js
    end  
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  def update  
    @post = Post.find(params[:id])
  
    respond_to do |format|  
      if @post.save  
        format.html { redirect_to(:action => :show, :id => @post.id) }  
        format.js  
      else  
        format.html { render :action => "edit" }  
        format.js  
      end  
    end  
end  
  def update2
    @post = Post.find(params[:id])
 
    if @post.update_attributes(params[:post])
      redirect_to :action => :show, :id => @post.id
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to :action => :index
  end
end
