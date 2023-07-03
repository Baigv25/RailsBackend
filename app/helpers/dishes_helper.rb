module DishesHelper
    def status_dishes
      Dish.status_dishes.keys.map do |status_dish|
        [t("activerecord.attributes.dish.status_dishes.#{status_dish}"), status_dish]
      end
    end
end
  