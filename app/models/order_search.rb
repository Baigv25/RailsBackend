class OrderSearch
    attr_reader :date_to, :date_from, :order_date, :client_id, :status

    def initialize(params)
        params ||= {}

        @date_from = parsed_date(params[:date_from])
        @date_to = parsed_date(params[:date_to])
        @order_date = parsed_date(params[:order_date])
        @client_id = params[:client_id]
        @status = params[:status]
    end

    #def date_scope
        #Order.where(order_date: order_date.beginning_of_day..order_date.end_of_day)
    #end

    def date_scope
        if date_from && date_to <= date_to
          Order.where(order_date: date_from.beginning_of_day..date_to.end_of_day)
        elsif order_date
          Order.where(order_date: order_date.beginning_of_day..order_date.end_of_day)
        else
          Order.all
        end
    end
      
      
        
      

    def client_scope
        Order.where('client_id = ?', client_id)
    end

    def status_scope
        Order.where(status: status)
    end
      

private

def parsed_date(date_string)
    Date.parse(date_string)
rescue ArgumentError, TypeError
end

end