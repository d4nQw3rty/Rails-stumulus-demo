import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ["items"]
  connect() {
  }

  activate(event){
    const target = event.currentTarget
    this.itemsTargets.forEach((el) => el.classList.remove("active"))
    target.classList.add("active")   
  }
}
