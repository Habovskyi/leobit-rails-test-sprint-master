# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text       :text
      t.references :film, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
