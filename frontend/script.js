document.addEventListener("DOMContentLoaded", function () {
    console.log("JavaScript Loaded");

    // Form Validation for Registration
    const registrationForm = document.getElementById("registration-form");

    if (registrationForm) {
        registrationForm.addEventListener("submit", function (event) {
            const name = document.getElementById("name").value.trim();
            const email = document.getElementById("email").value.trim();
            const password = document.getElementById("password").value.trim();

            if (name === "" || email === "" || password === "") {
                alert("All fields are required.");
                event.preventDefault();
            }
        });
    }

    // Dynamically Load Tournament Schedule
    const scheduleTable = document.getElementById("schedule-table");

    if (scheduleTable) {
        fetch("backend/fetch_schedule.php")
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    scheduleTable.innerHTML = `<tr><td colspan="4">${data.error}</td></tr>`;
                    return;
                }

                let scheduleHTML = "";
                data.forEach(match => {
                    scheduleHTML += `
                        <tr>
                            <td>${match.team1} vs ${match.team2}</td>
                            <td>${match.match_time}</td>
                            <td>${match.location}</td>
                        </tr>`;
                });
                scheduleTable.innerHTML = scheduleHTML;
            })
            .catch(error => {
                scheduleTable.innerHTML = `<tr><td colspan="4">Error loading schedule.</td></tr>`;
                console.error("Error:", error);
            });
    }
});
