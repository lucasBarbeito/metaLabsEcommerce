require 'rails_helper'

RSpec.describe "cart_products/new", type: :view do
  before(:each) do
    assign(:cart_product, CartProduct.new(
      product: nil,
      cart: nil
    ))
  end

  it "renders new cart_product form" do
    render

    assert_select "form[action=?][method=?]", cart_products_path, "post" do

      assert_select "input[name=?]", "cart_product[product_id]"

      assert_select "input[name=?]", "cart_product[cart_id]"
    end
  end
end
