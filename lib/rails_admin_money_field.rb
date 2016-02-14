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
          RailsAdmin::Config::Fields::Types::register(:money, self)

          def allowed_methods
            [@name, cents_field, currency_field]
          end

          register_instance_option(:partial) do
            :form_money
          end

          register_instance_option(:cents_field) do
            "#{@name}_cents"
          end

          register_instance_option(:currency_field) do
            "#{@name}_currency"
          end

          register_instance_option(:currencies) do
            nil
          end

          register_instance_option(:default_currency) do
            nil
          end

          def currency_collection
            if currencies
              currencies.map { |c| ::Money::Currency.find(c.to_sym) }
            else
              ::Money::Currency.all
            end
          end
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


