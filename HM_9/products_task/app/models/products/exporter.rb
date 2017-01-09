class Products::Exporter

  FIELD_NAMES = %w(# name price created_at).freeze

  class << self

    def to_csv(products)
      CSV.generate do |csv|
        csv << FIELD_NAMES
        products.each_with_index do |product, index|
          csv << values(product, index)
        end
      end
    end

  private
    
    def values(product, index)
      [
        index + 1,
        product.name,
        product.price,
        product.created_at.strftime('%b %d %Y')
      ]
    end
  end
end
