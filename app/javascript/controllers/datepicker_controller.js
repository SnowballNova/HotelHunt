import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  connect() {
    console.log("Datepicker controller connected")
    flatpickr(this.element, {
      mode: "range",
      minDate: "today",
      dateFormat: "Y-m-d"
    })
  }
}
