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


    if (slides[currentSlide]) {
        slides[currentSlide].style.left = '-100%';
    } else {}

    currentSlide = (currentSlide + 1) % totalSlides;

    if (slides[currentSlide]) {
        slides[currentSlide].style.left = '0';
    } else {}
}


document.addEventListener('DOMContentLoaded', () => {
    showSlide(currentSlide);
    setInterval(nextSlide, 5000); // Change slide every 3 seconds
});


/*Chat button
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
*/


document.getElementById('toggleButton').addEventListener('click', function () {
    document.getElementById('navbar').classList.toggle('active');
});

document.getElementById('leaveCommentButton').addEventListener('click', function (event) {
    event.preventDefault();
    $('#reviewModal').modal('show');
    $.ajax({
        url: "{% url 'create-review' %}",
        type: "GET",
        success: function (data) {
            $('#reviewModal .modal-body').html(data);
        }
    });
});



// Function to update the color of the dot based on pending items
function updateDotColor() {
    let dotElement = document.getElementById('adminDot');
    if (checkPendingItems()) {
        dotElement.classList.remove('badge-secondary');
        dotElement.classList.add('badge-danger');
    } else {
        dotElement.classList.remove('badge-danger');
        dotElement.classList.add('badge-secondary');
    }
}

// Call the function when the page loads
updateDotColor();

// Get all room buttons
const roomButtons = document.querySelectorAll('.booking-btn');

// Add click event listener to each button
roomButtons.forEach(button => {
    button.addEventListener('click', () => {
        console.log('Button clicked:', button);
        const roomType = button.dataset.room;
        console.log('Room type:', roomType);
        filterRoomsByType(roomType);
    });
});

// Function to filter rooms by type and display them
function filterRoomsByType(roomType) {
    console.log('Filtering rooms by type:', roomType);
    // Get all room cards
    const roomCards = document.querySelectorAll('.room-card');

    // Hide all room cards
    roomCards.forEach(card => {
        card.style.display = 'none';
    });

    // Show only room cards of the selected type
    const filteredRooms = document.querySelectorAll(`.room-card[data-room-type="${roomType}"]`);
    filteredRooms.forEach(card => {
        card.style.display = 'block';
    });
}

function filterRooms(roomType) {
    var roomCards = document.querySelectorAll('.room-card');
    roomCards.forEach(function (card) {
        var cardType = card.getAttribute('data-room-type');
        if (cardType === roomType) {
            card.style.display = 'block';
        } else {
            card.style.display = 'none';
        }
    });
}


$(document).ready(function(){
    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
        startDate: new Date(),
        autoclose: true
    });
});


