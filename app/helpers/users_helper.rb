module UsersHelper
    def user_types
        User.user_types.keys.map do |user_type|
            [t("activerecord.attributes.user.types.#{user_type}"), user_type]
        end
    end
end