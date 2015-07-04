Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUB_TEST'],
  :secret_key      => ENV['STRIPE_SECRET_TEST']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]