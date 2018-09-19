class CreateThirdPartyServices < SpreeExtension::Migration[4.2]
  def change
    create_table :third_party_services do |t|
      t.string :name
      t.text :script
      t.boolean :enabled, default: true

      t.timestamps null: false
    end
  end
end
