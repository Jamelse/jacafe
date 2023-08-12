class CartsController < ApplicationController
  before_action :set_cart

  def show 
    if session.include? :cart_id
      set_cart
    else
      @cart = Cart.create!
      session[:cart_id] = @cart.id
      @cart
    end
    render json: @cart
  end

  def update 
    coffee = Coffee.find_by(id: params[:coffee_id])
     cartI = @cart.cart_items.find_by(coffee_id: coffee.id)
       if cartI
         cartI.update!(quantity: params[:quantity] + cartI.quantity)
       else 
        @cart.cart_items.create!(quantity: params[:quantity], coffee_id: coffee.id)
       end
      render json: @cart, status: :accepted
  end

  def new_quantity 
    item = find_cart_item
    item.update!(quantity: params[:quantity])
    render json: @cart, status: :accepted
  end

  def destroy
    item = find_cart_item
    item.destroy
    render json: @cart
  end

  private
  
  def set_cart 
    @cart = Cart.find(params[:id])
  end

  def find_cart_item
   @cart.cart_items.find_by(id: params[:cart_item_id]) 
  end
end
