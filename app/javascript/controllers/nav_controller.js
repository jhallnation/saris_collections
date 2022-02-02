import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "content" ]

  dropdown(event) {
    this.contentTarget.style.display === "none" ? this.contentTarget.style.display = "block" : this.contentTarget.style.display = "none";
    console.log(this.contentTarget.style.display);
  }
}
