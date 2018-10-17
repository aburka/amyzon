require "stripe"
Stripe.api_key = Amyzon::Application.credentials.stripe[:secret_key]
