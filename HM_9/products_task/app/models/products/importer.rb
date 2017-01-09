class Products::Importer

  class << self

    def import(csv_data)
      parse_csv(csv_data).each do |row|
        product_data = row.to_hash
        create_product(product_data)
      end
    end

    private

    def parse_csv(csv_data)
      CSV.parse(csv_data, headers: true)
    end

    def create_product(product_data)
      Product.create(name: product_data["name"], price: product_data["price"])
    end
  end
end
