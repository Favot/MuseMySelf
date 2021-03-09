class ChangeDefaultCompletedOnUserJourney < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:user_journeys, :completed, false)
  end
end
