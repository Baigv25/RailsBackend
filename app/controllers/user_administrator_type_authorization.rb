module UserAdministratorTypeAuthorization
    extend ActiveSupport::Concern

    included do
      before_action :check_user_type
    end

    private

    def check_user_type
      unless current_user && current_user.user_type == 'administrator'
        redirect_to root_path, alert: t('application.unauthorized_access')
      end
    end
end