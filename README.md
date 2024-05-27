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
### User Goals
1. **Easy Navigation and Booking**: Users want a straightforward and intuitive interface to navigate through the website and make bookings for hotel rooms and restaurant tables effortlessly.
2. **Access to Information**: Users need quick access to essential information about the hotel, including room details, dining options, and promotions.
3. **Real-Time Assistance**: Users seek immediate help and answers to their queries through an interactive chat feature, providing real-time support.
4. **Review and Feedback**: Users want to read reviews from previous guests and leave their feedback to help future visitors make informed decisions.
5. **Responsive Design**: Users expect a seamless experience across all devices, including desktops, tablets, and smartphones.

### Site Owner Goals
1. **Increase Bookings**: The primary goal is to drive more bookings for hotel rooms and restaurant tables through a user-friendly and engaging website.
2. **Enhance User Engagement**: The site aims to keep users engaged with interactive features like the chat function and dynamic content such as slideshows and reviews.
3. **Showcase Amenities and Promotions**: The site should effectively highlight the hotel’s services and current promotions to attract potential guests.
4. **Collect User Feedback**: Gathering reviews and feedback from guests helps improve services and build a trustworthy reputation for future visitors.
5. **Promote Social Media Presence**: Encouraging users to follow and interact with the hotel's social media profiles helps in building an online community and increasing brand visibility.


### User Stories
#### Epic 1 - User account creation process
<!-- Epic 1 content here -->

#### Epic 2 - Development of a course booking system
<!-- Epic 2 content here -->

#### Epic 3 - Development of a contact form
<!-- Epic 3 content here -->

#### Epic 4 - Enhancing website aesthetics
<!-- Epic 4 content here -->

#### Epic 5 - Employee workshop news feed
<!-- Epic 5 content here -->

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