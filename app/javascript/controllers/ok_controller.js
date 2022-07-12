import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "OK!!!!!!";
  }

  onclick() {
    console.log('clicked');
    this.element.textContent = "Done";
  }
}
