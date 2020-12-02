file_path = 'spree/layouts/admin'
deface_selector = "[data-hook='admin_tabs'] erb[loud]:contains('spree/admin/shared/main_menu')"
if Spree.version.to_f >= 4.0
  file_path = 'spree/admin/shared/_main_menu'
  deface_selector = "erb[loud]:contains('t(:configurations)')"
end

Deface::Override.new(virtual_path: file_path,
                     name: 'add_third_party_service_manager_to_admin_tabs',
                     insert_after: deface_selector,
                     text: '<ul class="nav nav-sidebar border-top w-100">
                              <%= main_menu_tree Spree.t(:third_party_services), icon: "cloud", sub_menu: "third_party_services", url: "#sidebar-third-party-services" %>
                            </ul>'
                    )


