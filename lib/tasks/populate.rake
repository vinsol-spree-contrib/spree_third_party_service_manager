namespace :spree_pages do
  desc "Create pages for third party services"
    task populate: :environment do
      
      # [controller, [:action1, :action2]]
      PAGE_SOURCES = [
                [Spree::HomeController, [:index]],
                [Spree::ProductsController, [:index, :show]],
                [Spree::OrdersController, [:show, :edit]],
                [Spree::CheckoutController, [:edit]],
                [Spree::TaxonsController, [:show]]
              ]


      def create_page(page_source)
        controller = page_source[0].to_s.underscore.remove('_controller')
        actions = page_source[1].map(&:to_s)

        actions.each do |action|
          page_name = controller + '/' + action

          page = Spree::Page.new(name: page_name)
          if page.save
            puts "Page #{page_name} successfully created."
          else
            puts "Page #{page_name} could not be created - #{page.errors.full_messages.join(', ')}"
          end
        end
      end


      PAGE_SOURCES.each do |page|
        create_page(page)
      end
    end
end
