class OrderSearch
    attr_reader :date_to, :date_from, :order_date, :client_id, :status

    def initialize(params)
        params ||= {}

        @date_from = parsed_date(params[:date_from])
        @date_to = parsed_date(params[:date_to])
        @client_id = params[:client_id]
        @status = params[:status]
    end

    #def date_scope
        #Order.where(order_date: order_date.beginning_of_day..order_date.end_of_day)
    #end

    def date_scope
        query = Order.all

        if date_from.present?
            query = query.where('order_date >= ?', date_from)
        end

        if date_to.present?
            query = query.where('order_date <= ?', date_to)
        end

        if status.present?
            query = query.where(status: status)
        end

        if client_id.present?
            query = query.where('client_id = ?', client_id)
        end

        query
    end

private

def parsed_date(date_string)
    Date.parse(date_string)
rescue ArgumentError, TypeError
end

end
