class ProductsController < ApplicationController

  before_action :find_product, only: [:destroy]

  def index
    @products = Product.search(params[:search]).page(params[:page]).per(5)
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    redirect_to products_path if @product.destroy
  end

  def import
    importer.import(uploaded_file)
    redirect_to :back, notice: "Products was successfuly added"
  rescue StandardError
    redirect_to :back, alert: "Error. Products are not imported :("
  end

  def export
    respond_to do |format|
      format.csv do
        send_data(exporter.to_csv(Product.all), filename: "products-#{Time.zone.today}.csv")
      end
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :price)
    end

    def find_product
      @product = Product.find(params[:id])
    end

    def uploaded_file
      File.read(params[:products_csv].tempfile)
    end

    def sort_column
      Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
    def exporter
      Products::Exporter
    end

    def importer
      Products::Importer
    end
end
