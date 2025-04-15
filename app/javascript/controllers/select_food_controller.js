import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-food"
export default class extends Controller {
  static targets = ["items"]
  connect() {
    console.log("selectFood connected")
   
      fetch(`/selections/fetch_ip_data?url=${encodeURIComponent('https://api.myip.com')}`, {
        headers: {
          'Accept': 'application/json'
        }
      })
      .then(response => response.json())
      .then(data => console.log(data))
    
  }

  selectFoodItems(event){
    const selectedItemsId = event.target.value
    const foodItems = this.itemsTarget
        
    if (selectedItemsId) {
      fetch(`/selections/food_options?option=${selectedItemsId}`, {
        headers: {
          'Accept': 'application/json'
        }
      })
        .then(response => response.json())
        .then(data => { 
          console.log(data)
          foodItems.innerHTML = "<option value= ''>Select food item</option>";
          data.forEach(element => {
            foodItems.innerHTML += `<option value="" >${element}</option>`           
          });
        })
    }
  }
}
