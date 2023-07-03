module ClientsHelper
    def status_clients
        Client.status_clients.keys.map do |status_client|
            [t("activerecord.attributes.user.types.#{status_client}"), status_client]
        end
    end
end