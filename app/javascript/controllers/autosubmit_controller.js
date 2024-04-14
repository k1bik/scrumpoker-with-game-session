import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["submitButton"]

  connect() {
    this.element.dataset["action"] = "input->autosubmit#submit"
  }

  submit() {
    clearTimeout(this.timeout)

    this.timeout = setTimeout(() => {
      this.submitButtonTarget.click()
    }, 100)
  }
}
