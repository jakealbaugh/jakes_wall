class WallController < ApplicationController
  before_action :twitter_client

  def index
    search = TweetsRequest.new.request('@jake_albaugh')
    tweets = @twitter.search(search, result_type: 'mixed').take(100)
    @tweets = TweetsPackage.new(tweets).package
    render json: @tweets
  end
end
