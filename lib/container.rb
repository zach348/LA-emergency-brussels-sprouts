class Container
  attr_reader :ingredients, :maximum_holding_weight, :container_weight

  def initialize(container_weight, maximum_holding_weight)
    @maximum_holding_weight = maximum_holding_weight
    @container_weight = container_weight
    @weight = container_weight
    @ingredient = nil
    @ingredients = []
  end

  def <<(ingredient)
    @ingredients << ingredient
  end

  def fill_with_ingredient(ingredient)
    @ingredient = ingredient.name
    capacity = Integer(@maximum_holding_weight / ingredient.weight)
    capacity.times{ self << Ingredient.new(ingredient.name,ingredient.weight)}
  end

  def weight
    (@container_weight + @ingredients.reduce(0){ |kg_sum, ingredient| kg_sum += ingredient.weight }).round
  end

  def remove_one_ingredient
    @ingredients.pop
  end

  def which_ingredient
    @ingredient
  end

  def empty
    @ingredients = []
  end

  def how_many_ingredients
    @ingredients.length
  end
end
