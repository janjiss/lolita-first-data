### INSTALL

1. For example create model "MySubscription"
2. Add include line:

    include Lolita::Billing:FirstData

3. Add special methods to your "MySubscription" and modify them to suit your needs:

    # Methods for #Lolita::Billing:FirstData
    #---------------------------------------

    # returns integer in cents
    def price
      self.total_price
    end

    # string up to 125 symbols
    # this will included in payment description
    def description
      "Payment to INC Lolipop"
    end

    # returns 3 digit string according to http://en.wikipedia.org/wiki/ISO_4217
    def currency
      "840"
    end

    # optional
    # this is called when FirstData merchant is taking some actions
    # there you can save the log message other than the default log file
    def log severity, message
      #self.logs.create(:severity => severity, :message => message)
    end
    #---------------------------------------

4. When you are ready to pay your payment controller action should end like this:

    @my_subscription = MySubscription....
    ....
    ....
    session[:first_data] ||= {}
    session[:first_data][:billing_class] = @my_subscription.class.to_s
    session[:first_data][:biling_id]     = @my_subscription.id
    session[:first_data][:answer_path]   = done_my_subscription_path
    redirect_to checkout_first_data_path

5. Configure your environments

    # For development.rb and test.rb
    #---------------------

    FIRST_DATA_PEM   = "#{RAILS_ROOT}/config/first-data/test.pem"
    FIRST_DATA_PASS  = "qwerty"

    config.after_initialize do
      ActiveMerchant::Billing::Base.mode = :test
    end

### TESTING

To test your session from your site to server and back we have test controller who will act as fake server. 
To do this you need to set billing to `:debug` mode

    config.after_initialize do
      ActiveMerchant::Billing::Base.mode = :debug
    end

And you need to run another rails server on port `3001` - this will act as FirstData server.
Then you will be able to make fake payments.