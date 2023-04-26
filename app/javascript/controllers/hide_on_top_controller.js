import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide-on-top"
export default class extends Controller {
  static targets = ['arrow'];
  connect() {
    window.addEventListener('scroll', this.checkScrollPosition.bind(this));
    this.checkScrollPosition();
  }

  disconnect() {
    window.removeEventListener('scroll', this.checkScrollPosition.bind(this));
  }

  checkScrollPosition() {
    if (window.pageYOffset === 0) {
      this.arrowTarget.classList.remove("show");
    } else {
      this.arrowTarget.classList.add("show");
    }
  }
}
