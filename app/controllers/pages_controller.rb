class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @topic = Topic.all
  end
end
