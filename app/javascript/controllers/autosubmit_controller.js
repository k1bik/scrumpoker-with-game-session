import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["submitButton"]

  submit() {
    clearTimeout(this.timeout)

    this.timeout = setTimeout(() => {
      this.submitButtonTarget.click()
    }, 100)
  }
}
