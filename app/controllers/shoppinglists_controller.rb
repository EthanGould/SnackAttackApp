class ShoppinglistsController <ApplicationController
  before_action :set_shopping_list, only: [:show, :edit, :update, :destroy]

  def index
    @shoppinglist = Shoppinglist.all
  end
end
