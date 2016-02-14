require "rails_admin_money_field/engine"

module RailsAdminMoneyField
end

require 'rails_admin/config/fields'
require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class MoneyField < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types::register(self)
        end
      end
    end
  end
end

RailsAdmin::Config::Fields.register_factory do |parent, properties, fields|
  if properties[:name] == :money_field
    fields << RailsAdmin::Config::Fields::Types::MoneyField.new(parent, properties[:name], properties)
    true
  else
    false
  end
end


