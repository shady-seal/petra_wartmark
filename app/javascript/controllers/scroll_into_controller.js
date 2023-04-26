import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-into"
export default class extends Controller {
  connect() {
  }

  scrollInto(targetId) {
    const element = document.getElementById(targetId);
    element.scrollIntoView({ behavior: 'smooth', block: 'end'});
  }

  scrollIntoAbout() {
    this.scrollInto("about");
  }

  scrollIntoContact() {
    this.scrollInto("contact");
  }

  scrollIntoTop() {
    this.scrollInto("top");
  }
}
