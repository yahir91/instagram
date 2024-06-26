import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search-results"
export default class extends Controller {
  search() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.element.requestSumbit()
    }, 200);
  }
}
