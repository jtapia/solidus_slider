class AddShowCaptionToSlides < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_slides, :show_caption, :boolean
  end
end
