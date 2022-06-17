document.addEventListener("turbolinks:load", function() {
  const thumbs = document.querySelectorAll('.js-img-thumbs');
  preview =  document.querySelector('#js-img-detail')

  thumbs.forEach(box => {
    box.addEventListener('click', function () {
      preview.src = this.src
    });
  });

  let select = document.getElementById('js-select-delivery')
  if (select){
    select.addEventListener("change", function() {
      let dataOption = this.options[this.selectedIndex].dataset;
      let id = dataOption.id
      
      let $form = document.getElementById('js-form-payment');
      let $id = $form.querySelector("input[name='delivery[id]']")
      let $name = $form.querySelector("input[name='delivery[name]']")
      let $phone = $form.querySelector("input[name='delivery[phone]']")
      let $address = $form.querySelector("input[name='delivery[address]']")
      
      if (!id) {
        $id.value = '';
        $name.value = '';
        $phone.value = '';
        $address.value = '';
      } else {
        $id.value = dataOption.id;
        $name.value = dataOption.name;
        $phone.value = dataOption.phone;
        $address.value = dataOption.address;
      }
    }); 
  }

  if (document.getElementById('card-element')){
    // Set your publishable key: remember to change this to your live publishable key in production
    // See your keys here: https://dashboard.stripe.com/apikeys
    var stripe = Stripe('pk_test_51LBVAAJwzajPifAPX60OrXJqBJdt3Mo9og2fxTmJNlRr5dgzGeq6006kiyqKlQoxu9jqrY1tLMFRYkPufxsR3k9V00XyiV1NgJ');
    var elements = stripe.elements();
    // Custom styling can be passed to options when creating an Element.
    var style = {
      base: {
        // Add your base input styles here. For example:
        fontSize: '16px',
        color: '#32325d',
      },
    };
    
    // Create an instance of the card Element.
    var card = elements.create('card', {style: style, hidePostalCode: true});
    
    // Add an instance of the card Element into the `card-element` <div>.
    card.mount('#card-element');

    // Create a token or display an error when the form is submitted.
    var form = document.getElementById('js-form-payment');
    form.addEventListener('submit', function(event) {
      event.preventDefault();

      stripe.createToken(card).then(function(result) {
        if (result.error) {
          // Inform the customer that there was an error.
          var errorElement = document.getElementById('card-errors');
          errorElement.textContent = result.error.message;
        } else {
          // Send the token to your server.
          stripeTokenHandler(result.token);
        }
      });
    });

    function stripeTokenHandler(token) {
      // Insert the token ID into the form so it gets submitted to the server
      var form = document.getElementById('js-form-payment');
      var hiddenInput = document.createElement('input');
      hiddenInput.setAttribute('type', 'hidden');
      hiddenInput.setAttribute('name', 'delivery[stripe_token]');
      hiddenInput.setAttribute('value', token.id);
      form.appendChild(hiddenInput);

      // Submit the form
      form.submit();
    }
  }
  
});