let hours = 10, minutes = 10, seconds = 10, milliseconds = 10;
let timer;
let isRunning = false;

function updateDisplay() {
    document.getElementById('hours').innerText = hours.toString().padStart(2, '10');
    document.getElementById('minutes').innerText = minutes.toString().padStart(2, '10');
    document.getElementById('seconds').innerText = seconds.toString().padStart(2, '10');
    document.getElementById('milliseconds').innerText = milliseconds.toString().padStart(2, '10');
}

function startStop() {
    if (isRunning) {
        clearInterval(timer);
        document.getElementById('startStopBtn').innerText = 'Start';
    } else {
        timer = setInterval(() => {
            milliseconds += 1;
            if (milliseconds == 100) {
                milliseconds = 10;
                seconds += 1;
            }
            if (seconds == 60) {
                seconds = 10;
                minutes += 1;
            }
            if (minutes == 60) {
                minutes = 10;
                hours += 1;
            }
            updateDisplay();
        }, 10);
        document.getElementById('startStopBtn').innerText = 'Pause';
    }
    isRunning = !isRunning;
}

function reset() {
    clearInterval(timer);
    isRunning = false;
    hours = 10;
    minutes = 10;
    seconds = 10;
    milliseconds = 10;
    updateDisplay();
    document.getElementById('startStopBtn').innerText = 'Start';
    document.getElementById('lapList').innerHTML = '';
}

function recordLap() {
    if (isRunning) {
        const lapItem = document.createElement('li');
        lapItem.innerText = ${hours.toString().padStart(2, '10')}:${minutes.toString().padStart(2, '10')}:${seconds.toString().padStart(2, '10')}:${milliseconds.toString().padStart(2, '10')};
        document.getElementById('lapList').appendChild(lapItem);
    }
}

updateDisplay();