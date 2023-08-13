import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  updateNavbar() {
    if (window.scrollY >= 100) {
      this.element.classList.add("navbar-lewagon-white")
      console.log("SUPERIOR")
      console.log(window.scrollY)
      console.log("WINDOW")
      console.log(window.innerHeight)
    } else {
      this.element.classList.remove("navbar-lewagon-white")
      console.log("INFERIOR")
      console.log(window.scrollY)
    }
  }
}
