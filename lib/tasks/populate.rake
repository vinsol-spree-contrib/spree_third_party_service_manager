namespace :spree_pages do
  desc "Create pages for third party services"
    task populate: :environment do
      
      CONTROLLER_REGEXP = /(spree\/)([a-z\/]+)(_controller)/
      def create_page(controller, *actions)
        actions.each do |action|
          page_name = controller.to_s.underscore.match(CONTROLLER_REGEXP)[2] + '/' + action.to_s
          page = Spree::Page.new(name: page_name)
          if page.save
            puts "Page #{page_name} successfully created."
          else
            puts "Page #{page_name} could not be created - #{page.errors.full_messages.join(', ')}"
          end
        end
      end

      create_page(Spree::HomeController, :index)
      create_page(Spree::ProductsController, :index, :show)
      create_page(Spree::OrdersController, :show, :edit)
      create_page(Spree::CheckoutController, :edit )
      create_page(Spree::TaxonsController, :show)

    end
end
