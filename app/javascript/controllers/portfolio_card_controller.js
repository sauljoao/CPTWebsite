import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["label", "body", "details", "button"]

  toggle() {
    this.detailsTarget.classList.toggle("hidden")
    this.buttonTarget.textContent = this.detailsTarget.classList.contains("hidden") ? "Preview" : "Hide"
  }

  spotlight(event) {
    this.labelTarget.textContent = event.params.label
    this.bodyTarget.textContent = `This example highlights ${event.params.label.toLowerCase()} as a visible part of the project experience.`
  }
}
