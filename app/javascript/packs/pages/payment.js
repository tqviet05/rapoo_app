window.onload = (event) => {
  let select = document.getElementById('js-select-delivery')
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
};
