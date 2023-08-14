import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Welcome to Your Movie Store", "You can store your favorite movie!"],
      typeSpeed: 50,
      loop: true
    })
  }
}
