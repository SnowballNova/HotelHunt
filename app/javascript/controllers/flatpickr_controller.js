import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

export default class extends Controller {
  static targets = [ "startTime", "endTime" ]

  connect() {
    flatpickr(this.startTimeTarget, {
      minDate: "today",
      dateFormat: "Y-m-d",
      plugins: [new rangePlugin({ input: "#booking_ends_at" })],
      onChange: function(selectedDates, dateStr, instance) {
        // Set minimum date for end date to be the selected start date
        if (selectedDates[0]) {
          const endDatePicker = document.querySelector("#booking_ends_at")._flatpickr
          endDatePicker.set("minDate", selectedDates[0])
        }
      }
    })
  }
}
