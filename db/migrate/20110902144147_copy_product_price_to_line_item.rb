class CopyProductPriceToLineItem < ActiveRecord::Migration
  def self.up
    LineItem.all.each do |line_item|
      product_price = Product.find(line_item.product_id).price
      line_item.price = product_price * line_item.quantity
      line_item.save
    end
  end

  def self.down
  end
end
