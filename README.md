### INSTALL

For Rails 2.x:

- `gem install lolita-first-data`
- `rails g lolita_first_data:install`

For Rails 3.x add to your Gemfile:

- `gem 'lolita-first-data'`

### SETUP

1) Generate certificates by running:

    rake first_data:generate_certificate

Generate certificates for both environments - test/production and specify correct merchantId.

2) Configure your environments

    # For development.rb and test.rb
    #---------------------

    FD_PEM   = "#{Rails.root}/config/first-data/test.pem"
    FD_PASS  = "qwerty"

    config.after_initialize do
      ActiveMerchant::Billing::Base.mode = :test
    end

3) Use `Lolita::FirstData::TestController` to pass all tests, visit url with nr= parameter according to test number in first data "Test Plan" section:

    http://localhost:3000/first_data_test/test?nr=1
    http://localhost:3000/first_data_test/test?nr=2
    http://localhost:3000/first_data_test/test?nr=3
    ...

### EXAMPLE MODEL

For example create model *Payment* and then add these special methods and modify them to suit your needs:
    
    include Lolita::Billing:FirstData
    
    # Model methods
    def paid?
      first_data_paid? || another_payment_method_paid?
    end

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
    
    # triggered when FirstData transaction is saved
    def payment_trx_saved trx
      case trx.status
      when 'processing'
        # update_attribute(:status, 'processing')
      when 'completed'
        # update_attribute(:status, 'completed')
      when 'rejected'
        # update_attribute(:status, 'rejected')
      end
    end
    
    # optional
    # this is called when FirstData merchant is taking some actions
    # there you can save the log message other than the default log file
    def log severity, message
      #self.logs.create(:severity => severity, :message => message)
    end
    #---------------------------------------

When you are ready to pay your payment controller action should end like this:

    @payment = Payment....
    ....
    ....
    session[:payment_data] ||= {}
    session[:payment_data][:billing_class] = @payment.class.to_s
    session[:payment_data][:billing_id]    = @payment.id
    session[:payment_data][:finish_path]   = done_payments_path
    redirect_to checkout_first_data_path

### TESTS

Get source and run `rspec spec`
