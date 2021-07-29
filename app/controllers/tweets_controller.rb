class TweetsController < ApplicationController
  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to current_user_path
    else
      flash[:danger] = @tweet.errors.full_messages.to_sentence
      redirect_to current_user_path
    end
  end

  def destroy
    @tweet = current_user.tweets.find_by(id: params[:id])
    @tweet.destroy
    redirect_to current_user_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
