class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 10000

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'gbp'
    )
    Payment.create(amount: @amount, user:current_user)
    redirect_to root_path
    flash[:error] = "Thanks for your payment! You really are terrific."
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
