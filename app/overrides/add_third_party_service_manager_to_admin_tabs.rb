Deface::Override.new(virtual_path: 'spree/layouts/admin',
                     name: 'add_third_party_service_manager_to_admin_tabs',
                     insert_after: "[data-hook='admin_tabs'] erb[loud]:contains('spree/admin/shared/main_menu')",
                     text: '<ul class="nav nav-sidebar">
                              <%= main_menu_tree Spree.t(:third_party_services), icon: "cloud", sub_menu: "third_party_services", url: "#sidebar-third-party-services" %>
                            </ul>'
                    )
