import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["product", "pages", "complexity", "addOn", "estimate"]

  connect() {
    this.update()
  }

  update() {
    const productPrice = Number(this.productTarget.selectedOptions[0]?.dataset.price || 2500)
    const pages = Math.min(Math.max(Number(this.pagesTarget.value || 5), 1), 40)
    const extraPages = Math.max(pages - 5, 0) * 180
    const addOns = this.addOnTargets
      .filter((checkbox) => checkbox.checked)
      .reduce((sum, checkbox) => sum + Number(checkbox.dataset.price || 0), 0)
    const multiplier = Number(this.complexityTarget.selectedOptions[0]?.dataset.multiplier || 1.25)
    const estimate = Math.round((productPrice + extraPages + addOns) * multiplier)

    this.estimateTarget.textContent = new Intl.NumberFormat("en-US", {
      style: "currency",
      currency: "USD",
      maximumFractionDigits: 0
    }).format(estimate)
  }
}
