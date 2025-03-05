document.addEventListener("DOMContentLoaded", function () {
    console.log("JavaScript Loaded");

    // Toggle Mobile Menu
    const menuToggle = document.getElementById("menu-toggle");
    const navMenu = document.getElementById("nav-menu");

    if (menuToggle) {
        menuToggle.addEventListener("click", function () {
            navMenu.classList.toggle("active");
        });
    }

    // Form Validation for Registration
    const registrationForm = document.getElementById("registration-form");

    if (registrationForm) {
        registrationForm.addEventListener("submit", function (event) {
            const name = document.getElementById("name").value.trim();
            const email = document.getElementById("email").value.trim();
            const password = document.getElementById("password").value.trim();

            if (name === "" || email === "" || password === "") {
                alert("All fields are required.");
                event.preventDefault(); // Stop form submission
            }
        });
    }

    // Dynamically Load Tournament Schedule
    const scheduleTable = document.getElementById("schedule-table");

    if (scheduleTable) {
        fetch("backend/fetch_schedule.php")
            .then(response => response.json())
            .then(data => {
                let scheduleHTML = "";
                data.forEach(match => {
                    scheduleHTML += `
                        <tr>
                            <td>${match.team1} vs ${match.team2}</td>
                            <td>${match.date}</td>
                            <td>${match.time}</td>
                            <td>${match.location}</td>
                        </tr>`;
                });
                scheduleTable.innerHTML = scheduleHTML;
            })
            .catch(error => console.error("Error loading schedule:", error));
    }
});

fetch("backend/fetch_schedule.php")
    .then(response => response.json())
    .then(data => {
        let scheduleHTML = "";
        data.forEach(match => {
            scheduleHTML += `
                <tr>
                    <td>${match.team1} vs ${match.team2}</td>
                    <td>${match.date}</td>
                    <td>${match.time}</td>
                    <td>${match.location}</td>
                </tr>`;
        });
        document.getElementById("schedule-table").innerHTML = scheduleHTML;
    })
    .catch(error => console.error("Error loading schedule:", error));
