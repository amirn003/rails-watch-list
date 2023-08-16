import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navlist"
export default class extends Controller {

  updateNavlist() {
    if (window.scrollY >= window.innerHeight) { //580
      this.element.classList.remove("navbar-brand-white")
    } else {
      this.element.classList.add("navbar-brand-white")
    }
  }
}
