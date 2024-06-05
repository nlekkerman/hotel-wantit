let currentSlide = 0;
const slides = document.querySelectorAll('.slide');
const totalSlides = slides.length;

function showSlide(index) {
    slides.forEach((slide, i) => {
        if (i === index) {
            slide.style.left = '0';
        } else {
            slide.style.left = '100%';
        }
    });
}

function nextSlide() {
    slides[currentSlide].style.left = '-100%';
    currentSlide = (currentSlide + 1) % totalSlides;
    slides[currentSlide].style.left = '0';
}

document.addEventListener('DOMContentLoaded', () => {
    showSlide(currentSlide);
    setInterval(nextSlide, 5000); // Change slide every 3 seconds
});


/*Chat button*/
document.getElementById('chatButton').addEventListener('click', function() {

  
    let chatWindow = document.getElementById('chatWindow');
    if (chatWindow.style.display === 'none' || chatWindow.style.display === '') {
        chatWindow.style.display = 'flex';
    } else {
        chatWindow.style.display = 'none';
    }
});

document.getElementById('closeChat').addEventListener('click', function() {
    var chatWindow = document.getElementById('chatWindow');
    chatWindow.style.display = 'none';
});

document.getElementById('sendButton').addEventListener('click', function() {
    var chatBody = document.querySelector('.chat-body');
    var chatInput = document.getElementById('chatInput');
    var newMessage = document.createElement('div');
    newMessage.classList.add('chat-message');
    newMessage.innerHTML = `<img src="https://via.placeholder.com/30" alt="avatar" class="avatar">
                            <div class="message-content">${chatInput.value}</div>`;
    chatBody.appendChild(newMessage);
    chatInput.value = '';
    chatBody.scrollTop = chatBody.scrollHeight; // Scroll to the bottom of the chat body
});

document.getElementById('toggleButton').addEventListener('click', function() {
    document.getElementById('navbar').classList.toggle('active');
});

document.getElementById('leaveCommentButton').addEventListener('click', function(event) {
    event.preventDefault();
    $('#reviewModal').modal('show');
    $.ajax({
        url: "{% url 'create-review' %}",
        type: "GET",
        success: function(data) {
            $('#reviewModal .modal-body').html(data);
        }
    });
});