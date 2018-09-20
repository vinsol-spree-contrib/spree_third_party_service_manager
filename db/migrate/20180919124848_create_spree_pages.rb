class CreateSpreePages < SpreeExtension::Migration[4.2]
  def change
    create_table :spree_pages do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
