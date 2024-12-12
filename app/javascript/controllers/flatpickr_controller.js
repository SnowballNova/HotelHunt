import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startTime", "endTime" ]

  connect() {
    flatpickr(this.startTimeTarget, {
      mode: "range",
      minDate: "today",
      dateFormat: "Y-m-d",
      altInput: true,
      altFormat: "F j, Y",
      onChange: (selectedDates) => {
        if (selectedDates.length === 2) {
          this.endTimeTarget.value = selectedDates[1].toISOString().split('T')[0]
        }
      }
    })
  }
}
