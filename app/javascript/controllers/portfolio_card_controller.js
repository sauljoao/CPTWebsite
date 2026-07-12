import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["label", "body", "details", "button"]

  toggle() {
    this.detailsTarget.classList.toggle("hidden")
    this.buttonTarget.textContent = this.detailsTarget.classList.contains("hidden") ? "Pré-visualizar" : "Ocultar"
  }

  spotlight(event) {
    this.labelTarget.textContent = event.params.label
    this.bodyTarget.textContent = `Este exemplo destaca ${event.params.label.toLowerCase()} como parte visível da experiência do projecto.`
  }
}
