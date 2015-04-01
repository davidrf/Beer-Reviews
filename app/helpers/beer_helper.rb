module BeerHelper
  def beer_owner
    current_user == @beer.user
  end
end
