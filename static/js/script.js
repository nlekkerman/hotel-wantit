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
