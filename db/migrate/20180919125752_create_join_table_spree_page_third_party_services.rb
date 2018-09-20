class CreateJoinTableSpreePageThirdPartyServices < SpreeExtension::Migration[4.2]
  def change
    create_table :spree_page_third_party_services do |t|
      t.references :page, index: { name: 'index_spree_page_third_party_services_on_page_id' }
      t.references :third_party_service, index: { name: 'indx_spree_page_third_party_services_on_third_party_service_id' }

      t.index [:page_id, :third_party_service_id], name: 'spree_page_third_party_services_page_id_third_party_service_id'
    end
  end
end
