# frozen_string_literal: true

class AddProductIdToSlides < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_slides, :product_id, :integer
  end
end
