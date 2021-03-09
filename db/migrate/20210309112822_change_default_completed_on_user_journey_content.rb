class ChangeDefaultCompletedOnUserJourneyContent < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:user_journey_contents, :completed, false)
  end
end
