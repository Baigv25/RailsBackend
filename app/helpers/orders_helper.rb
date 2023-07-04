module OrdersHelper
    def statuses
      Order.statuses.keys.map do |status|
        [t("activerecord.attributes.dish.status_dishes.#{status}"), status]
      end
    end
end
  