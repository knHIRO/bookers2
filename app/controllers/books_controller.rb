class BooksController < ApplicationController

  before_action :ensure_correct_user ,only:[:edit, :destroy, :update]
  def new

  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book= Book.new(book_params)

    @book.user_id = current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # 4. トップ画面へリダイレクト
    flash[:notice]="You have created book successfully."

    redirect_to book_path(@book.id)
    else
    @books = Book.all
    @user = current_user
    render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users =User.all
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
    @users =User.all
  end

  def edit
     @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

   def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice]="You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    render :edit
    end

   end



  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    unless @user == current_user
    redirect_to books_path
    end
  end
end
