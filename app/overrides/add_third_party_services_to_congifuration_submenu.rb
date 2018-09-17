Deface::Override.new(virtual_path: 'spree/admin/shared/sub_menu/_configuration',
                     name: 'add_third_party_services_to_configuration_submenu',
                     insert_top: '[data-hook="admin_configurations_sidebar_menu"]',
                     text: "<%= configurations_sidebar_menu_item(Spree.t(:third_party_services), spree.admin_third_party_services_path) %>"
                     )
