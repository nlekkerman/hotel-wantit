/*jshint esversion: 6*/
// Wait for the DOM content to be fully loaded
document.addEventListener('DOMContentLoaded', () => {
    // Initialize variables
    let currentSlide = 0;
    const slides = document.querySelectorAll('.slide');
    const totalSlides = slides.length;

    // Navbar toggler functionality
    const toggler = document.querySelector('.navbar-toggler');
    const navbar = document.querySelector('.navbar');
    const navbarCollapse = document.querySelector('#navbarNav');

    toggler.addEventListener('click', () => {
        navbar.classList.toggle('toggler-active');
    });

    // Function to move slides in a carousel
    function moveSlide(direction) {
        currentSlide = (currentSlide + direction + totalSlides) % totalSlides;

        const carouselSlide = document.querySelector('.carousel-slide');
        const offset = -currentSlide * 100;
        carouselSlide.style.transform = `translateX(${offset}%)`;
    }

    // Set interval to automatically change slides every 5 seconds
    setInterval(() => {
        moveSlide(1); // Change slide every 5 seconds
    }, 5000);

    // Event listener for leaving a comment (assuming using Bootstrap modal)
    const leaveCommentButton = document.getElementById('leaveCommentButton');
    leaveCommentButton.addEventListener('click', function(event) {
        event.preventDefault();
        $('#reviewModal').modal('show'); // Assuming Bootstrap modal
        $.ajax({
            url: "{% url 'create-review' %}",
            type: "GET",
            success: function(data) {
                $('#reviewModal .modal-body').html(data);
            }
        });
    });

    // Function to update dot color based on pending items
    function updateDotColor() {
        const dotElement = document.getElementById('adminDot');
        dotElement.classList.toggle('badge-danger', checkPendingItems());
    }

    // Function to check pending items (dummy function for illustration)
    function checkPendingItems() {
        return true; // Replace with your logic to check pending items
    }

    // Call updateDotColor function when the page loads
    updateDotColor();

    // Filter rooms by type on button click
    const roomButtons = document.querySelectorAll('.booking-btn');
    roomButtons.forEach(button => {
        button.addEventListener('click', () => {
            const roomType = button.dataset.room;
            filterRoomsByType(roomType);
        });
    });

    // Function to filter rooms by type and display them
    function filterRoomsByType(roomType) {
        const roomCards = document.querySelectorAll('.room-card');
        roomCards.forEach(card => {
            const cardType = card.getAttribute('data-room-type');
            card.style.display = (cardType === roomType) ? 'block' : 'none';
        });
    }

    // Datepicker initialization (assuming using Bootstrap datepicker)
    $('.datepicker').datepicker({
        format: 'yyyy-mm-dd',
        startDate: new Date(),
        autoclose: true
    });

    // Initialize review modal (assuming using Bootstrap modal)
    const reviewForm = document.getElementById('reviewForm');
    const reviewModal = new bootstrap.Modal(document.getElementById('reviewModal'));

    // Event listener for review form submission
    reviewForm.addEventListener('submit', function(event) {
        event.preventDefault();
        setTimeout(() => {
            reviewModal.show(); // Show the review modal after a delay
        }, 500); // Adjust delay as needed
    });

    // Other functions and event listeners as needed
});
