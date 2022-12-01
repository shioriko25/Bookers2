class RemovePostImageFromFavorite < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :post_image, :integer
  end
end
