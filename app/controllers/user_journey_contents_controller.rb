class UserJourneyContentsController < ApplicationController
  def show
    @user_journey_contents = UserJourneyContent.find(params[:id])
    @content = @user_journey_contents.content
    
  end
end
