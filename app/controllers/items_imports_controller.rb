class ItemsImportsController < ApplicationController

  def index
  end

  def new
    @items_import = ItemsImport.new
  end
  
  def download_sample_excel
    send_file("#{Rails.root}/public/sample_excel.xlsx")
  end
  
  def create
    @items_import = ItemsImport.new(items_import_params)
  
    respond_to do |format|
      if @items_import.save
        format.html { redirect_to items_path, notice: 'Items import was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  private
    # Only allow a list of trusted parameters through.
    def items_import_params
      # params.require(:items_import).permit(:file_name, :uploaded_by, :uploaded_at, :status)
      params.fetch(:items_import, {}).permit(:file_name, :uploaded_by, :uploaded_at, :status, :file)
    end
 
end
