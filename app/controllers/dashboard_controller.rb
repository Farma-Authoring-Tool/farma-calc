class DashboardController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def last_comments_answers
    @answers =  current_user.answers.gte("comment_count" => 1).desc(:comment_count).limit(20)
  end
end
