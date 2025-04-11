import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="lettercounter"
export default class extends Controller {
  static targets = ["word", "countletters"]

  get(e) {
    const input_word = e.target.value.length
    this.countlettersTarget.innerText = input_word
  }
}
