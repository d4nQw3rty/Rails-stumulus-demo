import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-food"
export default class extends Controller {
  static targets = ["items"]
  connect() {
    console.log("selectFood connected")
  }

  selectFoodItems(event){
    const selectedItemsId = event.target.value
    console.log(selectedItemsId)
    const foodItems = this.itemsTarget
    console.log(foodItems)
    
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
