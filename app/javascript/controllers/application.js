import { Application } from "@hotwired/stimulus"
// import "./report_controller"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// application.register("report", ReportController);

export { application }
