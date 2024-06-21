let currentSlide = 0;
const slides = document.querySelectorAll('.slide');
const totalSlides = slides.length;


document.addEventListener('DOMContentLoaded', (event) => {
    const toggler = document.querySelector('.navbar-toggler');
    const navbar = document.querySelector('.avbar');
    const navbarCollapse = document.querySelector('#navbarNav');

    toggler.addEventListener('click', () => {
        if (!navbarCollapse.classList.contains('show')) {
            navbar.classList.add('toggler-active');
        } else {
            navbar.classList.remove('toggler-active');
        }
    });
});

function moveSlide(direction) {
    console.log("asnckjanckjas")
    const slides = document.querySelectorAll('.carousel-item');
    const totalSlides = slides.length;

    currentSlide = (currentSlide + direction + totalSlides) % totalSlides;

    const carouselSlide = document.querySelector('.carousel-slide');
    const offset = -currentSlide * 100;
    carouselSlide.style.transform = `translateX(${offset}%)`;
}

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


$(document).ready(function () {
    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
        startDate: new Date(),
        autoclose: true
    });
});



    // Wait for the document to be ready
    document.addEventListener('DOMContentLoaded', function() {
        // Select form and button elements
        const reviewForm = document.getElementById('reviewForm');
        const submitReviewBtn = document.getElementById('submitReviewBtn');
        const reviewModal = new bootstrap.Modal(document.getElementById('reviewModal')); // Assuming you're using Bootstrap modal

        // Add event listener for form submission
        reviewForm.addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent the default form submission

            // Perform AJAX request or submit form data here
            // For demonstration purposes, simulate a delay before showing the modal
            setTimeout(function() {
                reviewModal.show(); // Show the modal
            }, 500); // Adjust the delay as needed
        });
    });

