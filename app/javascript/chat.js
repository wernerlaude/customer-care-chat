document.addEventListener('DOMContentLoaded', function() {
    const messageInput = document.getElementById('messageInput');
    const messagesContainer = document.getElementById('messages');

    // Auto-scroll zum neuesten Chat beim Laden
    scrollToBottom();

    // Focus auf Input-Feld
    if (messageInput) {
        messageInput.focus();
    }

    // Quick reply functionality
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('quick-reply')) {
            const replyText = e.target.dataset.reply;
            if (messageInput) {
                messageInput.value = replyText;
                messageInput.focus();
            }
        }
    });

    // Feedback functionality
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('feedback-btn')) {
            const feedback = e.target.dataset.feedback;

            // Remove active class from all feedback buttons
            document.querySelectorAll('.feedback-btn').forEach(btn => {
                btn.classList.remove('active');
            });

            // Add active class to clicked button
            e.target.classList.add('active');

            console.log('Feedback:', feedback);
        }
    });

    // Auto-scroll beim Form Submit
    const messageForm = document.getElementById('message_form');
    if (messageForm) {
        messageForm.addEventListener('submit', function() {
            // Kurz warten und dann scrollen (nach dem Page-Reload)
            setTimeout(scrollToBottom, 100);
        });
    }
});

function scrollToBottom() {
    const messagesContainer = document.getElementById('messages');
    if (messagesContainer) {
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }
}

// Scroll auch wenn Window Resize passiert
window.addEventListener('resize', function() {
    setTimeout(scrollToBottom, 100);
});