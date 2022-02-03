import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "content" ]
  static classes = [ "display" ]

  connect() {
    this.contentTarget.classList.add(this.displaylass);
  }
  dropdown(event) {
    this.contentTarget.classList.toggle(this.displayClass);
  }
}
