class Order < ActiveRecord::Base
  PAYMENT_TYPE = ['Check','Credit Cart','Purchase order']
  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPE
  has_many :line_items, :dependent => :destroy

  def add_lint_item_from_cart(cart)
    cart.line_items.each do |line_item|
      line_item.cart_id = nil
      line_items<< line_item
    end
  end
end
