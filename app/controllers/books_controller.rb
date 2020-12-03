class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:isbn, :title, :description, :author)
    end



  #   def import_from_excel
  #     file = params[:file]
  #     begin
  #       file_ext = File.extname(file.original_filename)
  #       raise "Unknown file type: #{file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
  #       spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(file.path) : Roo::Excelx.new(file.path)
  #       header = spreadsheet.row(1)
  #       ## We are iterating from row 2 because we have left row one for header
  #       (2..spreadsheet.last_row).each do |i|
  #         Book.create(isbn: spreadsheet.row(i)[0], title: spreadsheet.row(i)[1], description: spreadsheet.row(i)[2], author: spreadsheet.row(i)[3])
  #       end
  #       flash[:notice] = "Records Imported"
  #       redirect_to books_path 
  #     rescue Exception => e
  #       flash[:notice] = "Issues with file"
  #       redirect_to books_path 
  #     end
  #  end
end
