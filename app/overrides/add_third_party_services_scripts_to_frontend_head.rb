Deface::Override.new(virtual_path: 'spree/layouts/spree_application',
                     name: 'add_third_party_services_scripts_to_frontend_head',
                     insert_bottom: '[data-hook="inside_head"]',
                     partial: 'spree/shared/third_party_services_scripts'
                     )
