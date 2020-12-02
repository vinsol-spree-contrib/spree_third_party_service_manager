if Spree.version.to_f > 4.0
  Deface::Override.new(virtual_path: 'spree/admin/shared/_main_menu',
                       name: 'add_third_party_service_manager_to_admin_tabs',
                       insert_after: "erb[loud]:contains('t(:configurations)')",
                       text: '<ul class="nav nav-sidebar border-top w-100">
                                <%= main_menu_tree Spree.t(:third_party_services), icon: "cloud", sub_menu: "third_party_services", url: "#sidebar-third-party-services" %>
                              </ul>'
                      )
else
  Deface::Override.new(virtual_path: 'spree/layouts/admin',
                     name: 'add_third_party_service_manager_to_admin_tabs',
                     insert_after: "[data-hook='admin_tabs'] erb[loud]:contains('spree/admin/shared/main_menu')",
                     text: '<ul class="nav nav-sidebar">
                              <%= main_menu_tree Spree.t(:third_party_services), icon: "cloud", sub_menu: "third_party_services", url: "#sidebar-third-party-services" %>
                            </ul>'
                    )
end


