import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="optative"
export default class extends Controller {
  static targets = ["selected", "idconcept"]
  sendId() {
    this.idconceptTarget.value = this.selectedTarget.value
  }
}
