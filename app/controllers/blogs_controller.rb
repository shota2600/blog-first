class BlogsController < ApplicationController
  before_action :find_post, only:[:show, :edit, :update, :destroy]
  
  def index
    @lists = List.order(created_at: :desc)
  end

  def show
  end
  
  def new
  end
  
  def edit
  end

  def create
    @list = List.new(post_params)
    if @list.save
      redirect_to @list, notice: '作成できました'
    else
      render :new, alert: '作成できませんでした'
    end
  end
  
  def update
    if @list.update(list_params)
      redirect_to @list, notice: '更新できました'
    else
      render :edit, alert: '更新できませんでした'
    end
  end
  
  def destroy
    if @list.destroy
      redirect_to root_path, notice: '削除に成功しました'
    else
      redirect_to root_path, alert: '削除に失敗しました'
    end
  end

  private
  
  def find_list
    @list = List.find(params[:id])
  end
  
end
