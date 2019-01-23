# README

Ruby API for connecting membership requests to Stripe.

TODO: convert this to Ruby + complete CIVIcrm integration

/*  var names = this.state.name.split(" ")
  console.log(this.state)
  stripe.customer.create(
    { email: this.state.email, description: this.state.name },
    function(err, customer) {

    }
  )
  /*
  crmAPI.create ('contact', {'contact_type':'Individual', 'first_name': names[0], 'last_name': names[1]},
         function(contact_result) {
           if (contact_result.is_error) {
             this.handleErrors()
           } else {
             crmAPI.create('Email', {'contact_id': contact_result.id, 'email':this.state.email },
                    function(email_result) {
                      if (email_result.is_error) {
                        this.handleErrors()
                      }
                    })
              crmAPI.call('Contribution', 'transact', {'contact_id': contact_result.id, 'amount': this.state.giving, 'financial_type_id': 'Donation',
                          'payment_instrument_id': "Credit Card", "payment_processor": 1, "source": "Online"},
                    function(contribution_result) {
                      if (contribution_result.is_error) {
                        this.handleErrors()
                      } else {
                      }
                    })
           }
         })

*/
