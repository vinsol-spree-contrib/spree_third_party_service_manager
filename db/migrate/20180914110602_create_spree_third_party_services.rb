class CreateSpreeThirdPartyServices < SpreeExtension::Migration[4.2]
  def change
    create_table :spree_third_party_services do |t|
      t.string :name
      t.text :script
      t.boolean :enabled, default: true

      t.timestamps null: false
    end
  end
end
