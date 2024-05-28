<!DOCTYPE html>
<html>
<head>
    <title>Indoor Climb</title>
</head>
<body>
    <h1>Select User and Attempt Status</h1>
    <form id="climberForm">
        <label for="user">Select User:</label>
        <select id="user" name="user">
            <option value="Neil">Neil</option>
            <option value="Nick">Nick</option>
            <option value="Declan">Declan</option>
        </select><br><br>
        
        <label for="status">Select Attempt Status:</label>
        <select id="status" name="status">
            <option value="attempt">Attempt</option>
            <option value="sent">Sent</option>
            <option value="flash">Flash</option>
        </select><br><br>
        
        <button type="button" onclick="logAttempt()">Log Attempt</button>
    </form>

    <script>
        function logAttempt() {
            const user = document.getElementById("user").value;
            const status = document.getElementById("status").value;
            const climbId = window.location.pathname.split("/").pop();
            const apiUrl = `https://indoorclimb.ing/routes/${climbId}/climber_attempt`;

            fetch(apiUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    climber_id: user,
                    climb_id: climbId,
                    attempt_status: status
                })
            })
            .then(response => {
                if (response.ok) {
                    alert('Attempt logged successfully');
                } else {
                    alert('Failed to log attempt');
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }
    </script>
</body>
</html>
