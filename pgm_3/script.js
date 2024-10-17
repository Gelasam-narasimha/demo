// Function to handle sending a message
function sendMessage() {
    const messageInput = document.getElementById('message-input');
    const message = messageInput.value.trim();
    
    if (message !== '') {
        const chatMessages = document.querySelector('.chat-messages');
        
        // Add user's message
        const messageElement = document.createElement('div');
        messageElement.classList.add('message');
        messageElement.textContent = message;
        chatMessages.appendChild(messageElement);
        
        messageInput.value = ''; // Clear the input field
        chatMessages.scrollTop = chatMessages.scrollHeight; // Scroll to the bottom of the chat
        
        // Generate an automatic response after a short delay
        setTimeout(generateResponse, 500);
    }
}

// Function to generate an automatic response
function generateResponse() {
    const chatMessages = document.querySelector('.chat-messages');
    
    // Simple example response
    const responses = [
        "hello,how are u?",
        "is it pk everything",
        "what about you?",
        "i am fine"        
    ];
    const randomIndex = Math.floor(Math.random() * responses.length);
    const response = responses[randomIndex];
    
    const responseElement = document.createElement('div');
    responseElement.classList.add('message');
    responseElement.textContent = response;
    responseElement.style.backgroundColor = "#d1f0d1"; // Different color for the bot's message
    chatMessages.appendChild(responseElement);
    
    chatMessages.scrollTop = chatMessages.scrollHeight; // Scroll to the bottom of the chat
}

// Event listeners
document.getElementById('send-button').addEventListener('click', sendMessage);

document.getElementById('message-input').addEventListener('keydown', (event) => {
    if (event.key === 'Enter') {
        event.preventDefault(); // Prevent the default form submission or other default behavior
        sendMessage();
    }
});
