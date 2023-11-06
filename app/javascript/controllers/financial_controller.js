// app/assets/javascripts/controllers/hello_controller.js
import { Controller } from "@hotwired/stimulus"

// Connects with data-controller="hello"
export default class extends Controller {
  static targets = [ "inss", "wage" ]

  calculateInss() {
    var inssValue = this.inssTarget

    $.ajax({
      url: "/financial/calculate_inss",
      data: {
        wage: this.wageTarget.value
      },
      type: "POST",
      success: function (data, _status, _xhr) {
        inssValue.setHTML("Valor do desconto do INSS: " + data.amount);
      }
    });
  }
}