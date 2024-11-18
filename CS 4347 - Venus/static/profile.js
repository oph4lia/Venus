document.addEventListener("DOMContentLoaded", function () {
    const email = localStorage.getItem("email");
    if (!email) {
        alert("Please log in to access your profile!");
        window.location.href = "account.html"; // Redirect to login page if not logged in
        return;
    }

    // Fetch user profile data
    fetch(`/api/profile/${email}`)
        .then((response) => response.json())
        .then((data) => {
            if (data.error) {
                alert(data.error);
                return;
            }
            // Populate form fields with user data
            document.getElementById("firstName").value = data.first_name || "";
            document.getElementById("lastName").value = data.last_name || "";
            document.getElementById("email").value = data.email || "";
            document.getElementById("phoneNumber").value = data.phone_number || "";
            document.getElementById("dob").value = data.dob || "";
        })
        .catch((error) => console.error("Error fetching profile data:", error));

    // Handle profile update form submission
    const profileForm = document.getElementById("ProfileForm");
    profileForm.addEventListener("submit", async (e) => {
        e.preventDefault();

        const firstName = document.getElementById("firstName").value;
        const lastName = document.getElementById("lastName").value;
        const phoneNumber = document.getElementById("phoneNumber").value;
        const dob = document.getElementById("dob").value;

        const response = await fetch(`/api/profile/${email}`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                first_name: firstName,
                last_name: lastName,
                phone_number: phoneNumber,
                dob: dob,
            }),
        });

        const data = await response.json();
        if (response.ok) {
            alert("Profile updated successfully!");
        } else {
            alert(data.error);
        }
    });
});

