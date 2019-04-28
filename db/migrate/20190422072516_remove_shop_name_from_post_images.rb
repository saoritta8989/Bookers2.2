class RemoveShopNameFromPostImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_images, :shop_name, :text
  end
end
