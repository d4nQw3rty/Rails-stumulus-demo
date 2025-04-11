import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upadndown"
export default class extends Controller {
  static targets = ["count"]

  add() {
    const counter = parseInt(this.countTarget.innerText) + 1
    this.countTarget.innerText = counter
  }
  take() {
    const counter = parseInt(this.countTarget.innerText) - 1
    this.countTarget.innerText = counter
  }
}
