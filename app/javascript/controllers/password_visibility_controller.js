import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="password-visibility"
export default class extends Controller {
  static targets = [ "eyeIcon", "eyeSlashIcon", "passwordInput" ]

  toggle() {
    if (this.eyeSlashIconTarget.classList.contains("hidden")) {
      this.passwordInputTarget.type = "text"
      this.eyeIconTarget.classList.add("hidden")
      this.eyeSlashIconTarget.classList.remove("hidden")
    } else {
      this.passwordInputTarget.type = "password"
      this.eyeIconTarget.classList.remove("hidden")
      this.eyeSlashIconTarget.classList.add("hidden")
    }
  }
}
