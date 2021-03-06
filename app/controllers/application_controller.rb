require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content])

    @posts = Post.all

    erb :index
  end

  get "/posts" do
    @posts = Post.all
    erb :index
  end

  get "/posts/:id" do
    @post = Post.find(params[:id])
    erb :show
  end

  get "/posts/:id/edit" do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch "/posts/:id" do
    post = Post.find(params[:id])
    post.update(content: params[:content], name: params[:name])
    @post = Post.find(params[:id])
    @post.content
  end

  delete "/posts/:id/delete" do
    @post = Post.find(params[:id])
    @post.destroy
    "#{@post.name} was deleted"

  end


end
