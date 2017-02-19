class SubscribersController < ApplicationController

  def index
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    gibbon = Gibbon::Request.new(api_key: ENV["MAILCHIMP_API_KEY"])
    gibbon.lists(ENV["MAILCHIMP_LIST_ID"]).members.create(body: {email_address: subscriber_params[:email], status: "subscribed"})
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      flash[:notice]="Thanks for signing up!"
    else
      flash[:alert]="oops! There was an error. Try again"
    end
  end

  private
  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
