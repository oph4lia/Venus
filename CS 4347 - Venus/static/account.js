document.getElementById("register-form").addEventListener("submit", function (e) {
    e.preventDefault(); // Prevent page reload

    const userData = {
        email: document.getElementById("email").value,
        password: document.getElementById("password").value,
        first_name: document.getElementById("first-name").value,
        last_name: document.getElementById("last-name").value,
        phone_number: document.getElementById("phone-number").value,
        user_type: document.getElementById("user-type").value,
        dob: document.getElementById("dob").value,
    };

    fetch("/api/users", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(userData),
    })
        .then((response) => response.json())
        .then((data) => {
            if (data.error) {
                alert("Error: " + data.error);
            } else {
                alert("User created with ID: " + data.user_id);
            }
        })
        .catch((error) => console.error("Error:", error));
});

    function handleError(error) {
        alert("An error occurred: " + error.message || error);
        console.error(error);
    }

