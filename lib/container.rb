class Container
  attr_reader :maximum_holding_weight, :weight, :ingredients

  def initialize(container_weight, maximum_holding_weight)
    MAXIMUM_HOLDING_WEIGHT = maximum_holding_weight
    CONTAINER_WEIGHT = container_weight
    @weight = container_weight
    @ingredient = nil
    @ingredients = []
  end

  def fill_with_ingredient(ingredient)
    @ingredient = ingredient.name
    @weight = CONTAINER_WEIGHT + MAXIMUM_HOLDING_WEIGHT

    capacity = Integer(@maximum_holding_weight / ingredient.weight)
    capacity.times do
      @ingredients << Ingredient.new(ingredient.name,ingredient.weight)
    end
  end

  def remove_one_ingredient
    @weight -= @ingredients.pop.weight
  end

  def which_ingredient
    @ingredient
  end

  def empty
    @ingredients = []
    @weight = CONTAINER_WEIGHT
  end

  def how_many_ingredients
    @ingredients.length
  end
end
