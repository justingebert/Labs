async function sendTimestamp() {
    const timestamp = Date.now();  // Get current timestamp in Unix epoch format
    const response = await fetch('/click', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ timestamp }),
    });
    const result = await response.json();
    console.log(result);
}

async function getTimestamps() {
    const response = await fetch('/click', {
        method: 'GET',
    });
    const result = await response.json();
    console.log(result);
    const timestamps = result.timestamps.join(', ');
    (<HTMLInputElement>document.getElementById('result')).value = timestamps;
}