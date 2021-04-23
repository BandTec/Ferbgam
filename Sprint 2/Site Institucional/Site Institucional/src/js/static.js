let contextLuminosity = document.querySelector('#chartLuminosity').getContext('2d');

let config = {
    type: 'bar',
    data: {
        labels: ['20:00', '19:00', '18:00', '17:00', '16:00', '15:00', '14:00','13:00'],
        datasets: [{
            label: 'Lux',
            data: [1200, 500, 750, 984, 1000, 475, 1600, 800],
            backgroundColor: [
                '#FF2501',
                '#FFBB33',
                '#548235',
                '#FF8800',
                '#FF2501',
                '#FFFF25',
                '#FF2501',
                '#548235',
            ],
            borderWidth: 1
        }]
    },
    options: {
        legend: {
            position: "top",
            align: "start"
        },
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
};



let chartLuminosity = new Chart(contextLuminosity, config);


let contextTemperature = document.querySelector('#chartTemperature').getContext('2d');



let configTemp = {
    type: 'bar',
    data: {
        labels: ['20:00', '19:00', '18:00', '17:00', '16:00', '15:00', '14:00','13:00'],
        datasets: [{
            label: 'Cº',
            data: [30, 19, 23, 26, 15, 28, 20, 54],
            backgroundColor: [
                '#FF2501',
                '#FF8800',
                '#548235',
                '#548235',
                '#FFFF25',
                '#548235',
                '#548235',
                '#FF2501',
            ],
            borderWidth: 1
        }]
    },
    options: {
        legend: {
            position: "top",
            align: "start"
        },
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
};

let chartTemperature = new Chart(contextTemperature, configTemp);




let contextHumidity = document.querySelector('#chartHumidity').getContext('2d');



let configHumi = {
    type: 'bar',
    data: {
        labels: ['20:00', '19:00', '18:00', '17:00', '16:00', '15:00', '14:00','13:00'],
        datasets: [{
            label: '%',
            data: [10, 30, 98, 85, 20, 54, 77, 5],
            backgroundColor: [
                '#FFFF25',
                '#548235',
                '#FFBB33',
                '#FF2501',
                '#548235',
                '#548235',
                '#FF8800',
                '#FFFF25',

            ],
            borderWidth: 1
        }]
    },
    options: {
        legend: {
            position: "top",
            align: "start"
        },
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
};

let chartHumidity = new Chart(contextHumidity, configHumi);
