class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  def add_product(product_id)
    current_item = LineItem.find_by_cart_id_and_product_id(self.id, product_id)
    if current_item.nil?
      current_item = LineItem.create(:product_id=>product_id,:cart_id=>self.id)
    else
      current_item.quantity += 1
    end
    current_item
  end
  def total_price
    #self.line_items.inject(0) do |sum, value|
    #     sum+value.total_price
    #end
    line_items.to_a.sum{|item| item.total_price}
  end
  def total_items
    line_items.sum(:quantity)
  end
end
