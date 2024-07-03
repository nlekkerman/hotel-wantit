# Hotel Wantit

## Introduction

Welcome to the Hotel Wantit page! This page is designed to offer a user-friendly and interactive experience for guests looking to book hotel rooms and restaurant tables at Hotel Wantit. Additionally, users can easily obtain all the information they need through our interactive chat feature.

## Table of Contents
- [Hotel Wantit](#frisa-booking)
  - [Introduction](#introduction)
  - [Table of Contents](#table-of-contents)
  - [User Experience](#user-experience)
    - [User Goals](#user-goals)
    - [Site Owner Goals](#site-owner-goals)
    - [User Stories](#user-stories)
      - [Epic 1 - User account creation process](#epic-1---user-account-creation-process)
      - [Epic 2 - Development of a course booking system](#epic-2---development-of-a-course-booking-system)
      - [Epic 3 - Development of a contact form](#epic-3---development-of-a-contact-form)
      - [Epic 4 - Enhancing website aesthetics](#epic-4---enhancing-website-aesthetics)
      - [Epic 5 - Employee workshop news feed](#epic-5---employee-workshop-news-feed)
  - [Design](#design)
    - [Color Scheme](#color-scheme)
    - [Typography](#typography)
    - [Imagery](#imagery)
    - [Wireframes](#wireframes)
      - [Index page](#index-page)
      - [About page](#about-page)
      - [Booking page](#booking-page)
      - [My bookings page](#my-bookings-page)
      - [Success page](#success-page)
      - [Edit booking page](#edit-booking-page)
      - [Sign up page](#sign-up-page)
      - [Sign in page](#sign-in-page)
      - [Sign out page](#sign-out-page)
      - [404 page](#404-page)
      - [500 page](#500-page)
    - [Entity Relationship Diagram - ERD](#entity-relationship-diagram---erd)
  - [Features](#features)
    - [Header](#header)
      - [Navigation bar](#navigation-bar)
      - [Navigation bar (as a logged in user)](#navigation-bar-as-a-logged-in-user)
      - [Navigation bar (as a staff member or superuser)](#navigation-bar-as-a-staff-member-or-superuser)
    - [Index page](#index-page-1)
      - [Hero image](#hero-image)
      - [Welcome text](#welcome-text)
      - [Member benefits](#member-benefits)
      - [Sign up button](#sign-up-button)
      - [Carousel](#carousel)
    - [About page](#about-page-1)
      - [Profile image](#profile-image)
      - [About text](#about-text)
      - [Contact form](#contact-form)
      - [Contact form response](#contact-form-response)
    - [Booking page](#booking-page-1)
      - [Workshop presentation](#workshop-presentation)
      - [Workshop booking](#workshop-booking)
      - [Booking pagination](#booking-pagination)
      - [Confirm booking modal](#confirm-booking-modal)
      - [Double booked modal](#double-booked-modal)
    - [Success page](#success-page-1)
      - [Confirmation text](#confirmation-text)
      - [Navigation buttons](#navigation-buttons)
    - [My bookings page](#my-bookings-page-1)
      - [No bookings - text](#no-bookings---text)
      - [No bookings - button](#no-bookings---button)
      - [Active bookings - text](#active-bookings---text)
      - [Active bookings - booked workshops](#active-bookings---booked-workshops)
      - [Active bookings pagination](#active-bookings-pagination)
      - [Confirm cancellation modal](#confirm-cancellation-modal)
    - [Edit booking page](#edit-booking-page-1)
      - [Available workshops](#available-workshops)
      - [Available workshops pagination](#available-workshops-pagination)
      - [Confirm workshop change modal](#confirm-workshop-change-modal)
    - [News page](#news-page)
    - [Sign up page](#sign-up-page-1)
    - [Sign in page](#sign-in-page-1)
    - [Sign out page](#sign-out-page-1)
    - [404 page](#404-page-1)
      - [404 page text](#404-page-text)
      - [404 page button](#404-page-button)
    - [500 page](#500-page-1)
      - [500 page text](#500-page-text)
      - [500 page tips](#500-page-tips)
    - [Footer](#footer)
  - [Features to be Added](#features-to-be-added)
  - [Testing](#testing)
    - [Validation of Code](#validation-of-code)
      - [HTML](#html)
      - [CSS](#css)
      - [JavaScript](#javascript)
      - [Python](#python)
    - [Lighthouse](#lighthouse)
      - [Desktop](#desktop)
      - [Mobile](#mobile)
    - [Wave Webaim - accessibility testing](#wave-webaim---accessibility-testing)
      - [Index page](#index-page-2)
      - [About page](#about-page-2)
      - [Booking page](#booking-page-2)
      - [Contrast Grid](#contrast-grid)
    - [Automated Testing](#automated-testing)
      - [About](#about)
      - [Booking](#booking)
      - [News](#news)
    - [Manual Testing](#manual-testing)
      - [Navigation bar](#navigation-bar-1)
      - [Index page](#index-page-3)
      - [About page](#about-page-3)
      - [Booking page](#booking-page-3)
      - [Success page](#success-page-2)
      - [My bookings page](#my-bookings-page-2)
      - [Edit booking page](#edit-booking-page-2)
      - [News page](#news-page-1)
      - [Sign up page](#sign-up-page-2)
      - [Sign in page](#sign-in-page-2)
      - [Sign out page](#sign-out-page-2)
      - [404 page](#404-page-2)
      - [500 page](#500-page-2)
      - [Footer](#footer-1)
  - [Bugs](#bugs)
  - [Technologies Used](#technologies-used)
  - [Deployment](#deployment)
    - [Fork repository in GitHub](#fork-repository-in-github)
    - [Clone repository in GitHub](#clone-repository-in-github)
    - [Deployment to Heroku](#deployment-to-heroku)
  - [Credits](#credits)
    - [Libraries used](#libraries-used)
    - [Used resources](#used-resources)
    - [Images](#images)
    - [Acknowledgements](#acknowledgements)
  - [User Experience](#user-experience-1)

## User Experience
## User Goals

### Hotel Guest/User

1. **Efficient Reservation Management**
   - *Goal:* Easily browse available rooms, select preferred dates, and make reservations seamlessly.
   - *Benefits:* Allows guests to efficiently plan and organize their accommodation needs.

2. **Transparent Booking Process**
   - *Goal:* Receive clear and detailed information about room types, amenities, prices, and availability.
   - *Benefits:* Helps guests make informed decisions and ensures expectations are met upon arrival.

3. **Interactive Feedback Mechanism**
   - *Goal:* Provide feedback through reviews and comments to share experiences and help improve service quality.
   - *Benefits:* Enhances user engagement and contributes to continuous improvement of services.

4. **Accessible Reservation Management**
   - *Goal:* Manage reservations, view booking details, and easily cancel bookings if necessary.
   - *Benefits:* Offers flexibility and control over bookings, ensuring a smooth experience.

5. **Responsive User Interface**
   - *Goal:* Access the booking system from various devices (desktop, tablet, mobile) with consistent usability.
   - *Benefits:* Provides convenience and accessibility for users on the go.

---

### Admin

1. **Centralized Management**
   - *Goal:* Monitor and manage reservations, reviews, and comments efficiently from a central dashboard.
   - *Benefits:* Facilitates oversight and ensures timely handling of guest interactions and feedback.

2. **Streamlined Approval Process**
   - *Goal:* Review and approve/reject pending reservations, reviews, and comments.
   - *Benefits:* Maintains quality control and responsiveness to guest needs and feedback.

3. **Enhanced Communication**
   - *Goal:* Communicate effectively with users regarding booking confirmations, updates, and responses to reviews/comments.
   - *Benefits:* Improves customer satisfaction and engagement through timely and personalized communication.

4. **Data-Driven Decision Making**
   - *Goal:* Utilize analytics and reports derived from reservation and feedback data to improve service offerings.
   - *Benefits:* Enables informed decisions to enhance guest experience and operational efficiency.

---

### Owner

1. **Business Growth and Profitability**
   - *Goal:* Increase occupancy rates and revenue through efficient booking and management processes.
   - *Benefits:* Maximizes profitability and supports sustainable business growth.

2. **Brand Reputation Management**
   - *Goal:* Maintain a positive online reputation through responsive customer service and proactive management of reviews.
   - *Benefits:* Builds trust with guests and enhances the hotel's brand image.

3. **Operational Efficiency**
   - *Goal:* Optimize resource allocation and operational processes based on reservation data and guest feedback.
   - *Benefits:* Improves efficiency, reduces costs, and enhances overall service delivery.

4. **Innovative Service Offerings**
   - *Goal:* Introduce new services or amenities based on guest preferences and market trends identified through booking and feedback data.
   - *Benefits:* Differentiates the hotel from competitors and attracts more guests.

## User Stories

### Admin Dashboard Management

**As an Admin, I want to access and manage reservations, comments, and reviews from a centralized dashboard so that I can efficiently oversee activities on the platform.**

**Description:**
The admin dashboard provides a centralized interface for admins to monitor and manage reservations, comments, and reviews. Admins can view counts of pending items and navigate to specific management pages for detailed actions.

**Acceptance Criteria:**
- **AC1:** Display the Admin Dashboard page with a title "Admin Dashboard."
- **AC2:** Include management cards for Reservations, Comments, and Reviews.
  - **AC2.1:** Each card displays the count of pending items.
  - **AC2.2:** Each card includes a brief description of its function.
- **AC3:** Clicking on a card navigates to the respective management page:
  - **AC3.1:** Reservations card navigates to Reservations Approval List.
  - **AC3.2:** Comments card navigates to Comments Approval List.
  - **AC3.3:** Reviews card navigates to Reviews Approval List.
- **AC4:** Ensure the dashboard layout is responsive to different screen sizes.

---

### Notifications and Interaction Management

**As a User, I want to manage my reservations, pending reviews, and pending comments from a notifications page so that I can efficiently organize my interactions within the hotel booking system.**

**Description:**
Users can access a notifications page where they can view and manage their reservations, pending reviews awaiting approval, and pending comments. This page enhances user interaction by providing a central hub for managing activities related to their bookings and interactions.

**Acceptance Criteria:**
- **AC1:** Users can navigate to the notifications page after logging into the hotel site.
- **AC2:** The notifications page prominently displays sections for "Reservations," "Pending Reviews," and "Pending Comments."
- **AC3:** Each section lists items with basic details (e.g., reservation IDs, review excerpts, comment previews).
- **AC4:** Clicking on an item within a section opens a modal or detailed view with comprehensive information.
- **AC5:** The notifications page is responsive and adjusts layout gracefully across different devices.

---

### Manage Reviews

**As a User, I want to create, edit, delete, and view details of my reviews so that I can share experiences and manage feedback effectively within the hotel booking system.**

**Description:**
Users have the ability to perform CRUD operations on their reviews, including creating new reviews, editing existing ones, deleting reviews, and viewing detailed information. This functionality allows users to maintain and update their review content as needed.

**Acceptance Criteria:**
- **AC1:** Users can create new reviews, providing details such as ratings and comments.
- **AC2:** Users can edit their existing reviews to update information or correct errors.
- **AC3:** Users can delete their reviews if they choose to remove them from the system.
- **AC4:** The system displays detailed information for each review, including ratings, comments, and related data.

---

### Booking System

**As a User, I want to easily reserve a room online, manage my bookings, and receive confirmation details so that I can efficiently plan and organize my accommodation needs.**

**Description:**
The booking system enables users to browse available rooms, select dates, make reservations, manage bookings, and receive confirmation details. This functionality ensures a seamless booking experience for users planning their accommodation within the hotel.

**Acceptance Criteria:**
- **AC1:** Users can view details of available rooms, including room types, amenities, and prices.
- **AC2:** Users can select check-in and check-out dates, choose room types, and initiate the reservation process.
- **AC3:** Users receive confirmation of their reservation with details such as room number, dates, total price, and booking status.
- **AC4:** Users can cancel their reservations if needed.
- **AC5:** The system suggests alternative room options if the selected room type is unavailable for the chosen dates.


## Design
### Color Scheme
<!-- Color Scheme content here -->

### Typography
<!-- Typography content here -->

### Imagery
<!-- Imagery content here -->

### Wireframes
#### Index page
<!-- Index page wireframe content here -->

#### About page
<!-- About page wireframe content here -->

#### Booking page
<!-- Booking page wireframe content here -->

#### My bookings page
<!-- My bookings page wireframe content here -->

#### Success page
<!-- Success page wireframe content here -->

#### Edit booking page
<!-- Edit booking page wireframe content here -->

#### Sign up page
<!-- Sign up page wireframe content here -->

#### Sign in page
<!-- Sign in page wireframe content here -->

#### Sign out page
<!-- Sign out page wireframe content here -->

#### 404 page
<!-- 404 page wireframe content here -->

#### 500 page
<!-- 500 page wireframe content here -->

### Entity Relationship Diagram - ERD
<!-- ERD content here -->

## Features
### Header
#### Navigation bar
<!-- Navigation bar content here -->

#### Navigation bar (as a logged in user)
<!-- Navigation bar (logged in user) content here -->

#### Navigation bar (as a staff member or superuser)
<!-- Navigation bar (staff member/superuser) content here -->

### Index page
#### Hero image
<!-- Hero image content here -->

#### Welcome text
<!-- Welcome text content here -->

#### Member benefits
<!-- Member benefits content here -->

#### Sign up button
<!-- Sign up button content here -->

#### Carousel
<!-- Carousel content here -->

### About page
#### Profile image
<!-- Profile image content here -->

#### About text
<!-- About text content here -->

#### Contact form
<!-- Contact form content here -->

#### Contact form response
<!-- Contact form response content here -->

### Booking page
#### Workshop presentation
<!-- Workshop presentation content here -->

#### Workshop booking
<!-- Workshop booking content here -->

#### Booking pagination
<!-- Booking pagination content here -->

#### Confirm booking modal
<!-- Confirm booking modal content here -->

#### Double booked modal
<!-- Double booked modal content here -->

### Success page
#### Confirmation text
<!-- Confirmation text content here -->

#### Navigation buttons
<!-- Navigation buttons content here -->

### My bookings page
#### No bookings - text
<!-- No bookings - text content here -->

#### No bookings - button
<!-- No bookings - button content here -->

#### Active bookings - text
<!-- Active bookings - text content here -->

#### Active bookings - booked workshops
<!-- Active bookings - booked workshops content here -->

#### Active bookings pagination
<!-- Active bookings pagination content here -->

#### Confirm cancellation modal
<!-- Confirm cancellation modal content here -->

### Edit booking page
#### Available workshops
<!-- Available workshops content here -->

#### Available workshops pagination
<!-- Available workshops pagination content here -->

#### Confirm workshop change modal
<!-- Confirm workshop change modal content here -->

### News page
<!-- News page content here -->

### Sign up page
<!-- Sign up page content here -->

### Sign in page
<!-- Sign in page content here -->

### Sign out page
<!-- Sign out page content here -->

### 404 page
#### 404 page text
<!-- 404 page text content here -->

#### 404 page button
<!-- 404 page button content here -->

### 500 page
#### 500 page text
<!-- 500 page text content here -->

#### 500 page tips
<!-- 500 page tips content here -->

### Footer
<!-- Footer content here -->

## Features to be Added
<!-- Features to be added content here -->

## Testing
### Validation of Code
#### HTML
<!-- HTML validation content here -->

#### CSS
<!-- CSS validation content here -->

#### JavaScript
<!-- JavaScript validation content here -->

#### Python
<!-- Python validation content here -->

### Lighthouse
#### Desktop
<!-- Lighthouse Desktop content here -->

#### Mobile
<!-- Lighthouse Mobile content here -->

### Wave Webaim - accessibility testing
#### Index page
<!-- Index page accessibility testing content here -->

#### About page
<!-- About page accessibility testing content here -->

#### Booking page
<!-- Booking page accessibility testing content here -->

### Contrast Grid
<!-- Contrast Grid content here -->

### Automated Testing
#### About
<!-- Automated Testing About content here -->

#### Booking
<!-- Automated Testing Booking content here -->

#### News
<!-- Automated Testing News content here -->

### Manual Testing
#### Navigation bar
<!-- Manual Testing Navigation bar content here -->

#### Index page
<!-- Manual Testing Index page content here -->

#### About page
<!-- Manual Testing About page content here -->

#### Booking page
<!-- Manual Testing Booking page content here -->

#### Success page
<!-- Manual Testing Success page content here -->

#### My bookings page
<!-- Manual Testing My bookings page content here -->

#### Edit booking page
<!-- Manual Testing Edit booking page content here -->

#### News page
<!-- Manual Testing News page content here -->

#### Sign up page
<!-- Manual Testing Sign up page content here -->

#### Sign in page
<!-- Manual Testing Sign in page content here -->

#### Sign out page
<!-- Manual Testing Sign out page content here -->

#### 404 page
<!-- Manual Testing 404 page content here -->

#### 500 page
<!-- Manual Testing 500 page content here -->

### Footer
<!-- Manual Testing Footer content here -->

## Bugs
<!-- Bugs content here -->

## Technologies Used
<!-- Technologies Used content here -->

## Deployment
### Fork repository in GitHub
<!-- Fork repository in GitHub content here -->

### Clone repository in GitHub
<!-- Clone repository in GitHub content here -->

### Deployment to Heroku
<!-- Deployment to Heroku content here -->

## Credits
### Libraries used
<!-- Libraries used content here -->

### Used resources
<!-- Used resources content here -->

### Images
<!-- Images content here -->

### Acknowledgements
<!-- Acknowledgements content here -->

## User Experience
<!-- User Experience content here -->