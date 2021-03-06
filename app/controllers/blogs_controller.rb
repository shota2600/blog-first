class BlogsController < ApplicationController
  
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  # アクションが実行される前に、指定したprivateアクション（:logged_in_user）を実行することができる。

  def index
    @lists = List.all.order(created_at: :desc)
  end

  def show
    @list = List.find(params[:id])
  end
  
  def new
    @list = List.new
  end
  
  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params) #データを新規登録するためのインスタンス変数
    @list.save
    redirect_to blogs_path 
    # '/blogs/new'
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to blogs_path
    else
      render :new
    end
  end
  
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to blogs_path
  end

  private
  
  def list_params # ストロングパラメータ
    params.require(:list).permit(:title, :body, :img) # パラメーターのキー
  end
end
