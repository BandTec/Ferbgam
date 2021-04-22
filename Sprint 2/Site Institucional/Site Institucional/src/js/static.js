let contextLuminosity = document.querySelector('#chartLuminosity').getContext('2d');

let config = {
    type: 'bar',
    data: {
        labels: ['Dia 1', 'Dia 2', 'Dia 3', 'Dia 3', 'Dia 4', 'Dia 5'],
        datasets: [{
            label: 'Lux',
            data: [12, 19, 3, 5, 5, 10],
            backgroundColor: [
                'rgba(24,150,117)',
                'rgba(24,150,117)',
                'rgba(24,150,117)',
                'rgba(24,150,117)',
                'rgba(24,150,117)',
                'rgba(24,150,117)',
            ],
            borderColor: [
                'rgba(24,150,117)',
                'rgba(24,150,117)',
                'rgba(24,150,117)',
                'rgba(24,150,117)',
                'rgba(24,150,117)',
                'rgba(24,150,117)',
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
