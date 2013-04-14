class AddPhotoToViolation < ActiveRecord::Migration
  def change
    add_attachment :parking_violations, :photo
  end
end
