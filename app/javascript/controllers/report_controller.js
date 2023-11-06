import { Controller } from "@hotwired/stimulus"

import { Chart, registerables} from 'chart.js';
Chart.register(...registerables);

// Connects to data-controller="report"
export default class extends Controller {
  static targets = ["proponents"];

  canvasContext() {
    return this.proponentsTarget.getContext('2d');
  }

  renderChart(data, context) {
    const keys = Object.keys(data)
    const values = []

    Object.values(data).forEach(value => {
      values.push(value.length)
    });


    new Chart(context, {
      type: 'bar',
      data: {
        labels: keys,
        datasets: [{
          label: '# of Votes',
          data: values,
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }

  getReportData() {
    const renderChart = this.renderChart
    const context = this.canvasContext()

    $.ajax({
      url: "/proponents/report.json",
      type: "GET",
      success: function (data, _status, _xhr) {
        renderChart(data.report_data, context)
      }
    });
  }

  connect() {
    this.getReportData()
  }
}
