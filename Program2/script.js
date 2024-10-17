// JavaScript to handle form submission and display registered details

document.getElementById('registrationForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent the form from submitting normally

    // Get form values
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;

    // Create a new div element to display the registered details
    const detailsDiv = document.createElement('div');
    detailsDiv.innerHTML = `
        <p><strong>Name:</strong> ${name}</p>
        <p><strong>Email:</strong> ${email}</p>
        <p><strong>Phone Number:</strong> ${phone}</p>
        <hr>
    `;

    // Append the new details to the registeredDetails div
    document.getElementById('registeredDetails').appendChild(detailsDiv);

    // Clear the form
    document.getElementById('registrationForm').reset();
});
