# Manual Testing

## Table of Contents
- [Test Case 1: Login and Logout](#test-case-1-login-and-logout)
- [Test Case 2: Navigation Links](#test-case-2-navigation-links)
- [Test Case 3: Edit and Create Review/Comment](#test-case-3-edit-and-create-reviewcomment)
- [Test Case 4: Reservation Form](#test-case-4-reservation-form)
- [Test Case 5: Availability Check for Rooms](#test-case-5-availability-check-for-rooms)

---

## Test Case 1: Login and Logout

**Description:**
Test the login and logout functionality.

**Steps:**
1. Navigate to the login page.
2. Enter valid credentials.
3. Click on the login button.
4. Verify successful login.
5. Navigate to various pages and verify the user is logged in.
6. Click on the logout button.
7. Verify successful logout.

**Expected Results:**

### Positive Outcome (Successful Login)
- User successfully logs in with valid credentials.
- Able to access protected pages for authenticated users.
  
![Positive Outcome - Successful Login](positive_login.png)

#### Additional Scenarios and Images:

### Redirect After Login
- After successful login, verify redirection to the intended page.
  
![Redirect After Login](positive_login_redirect.png)

### Negative Outcome (Invalid Credentials)
- User enters invalid credentials.
- Login form displays error message indicating invalid credentials.
  
![Negative Outcome - Invalid Credentials](negative_login_invalid.png)

### Negative Outcome (Login with Empty Fields)
- Attempt to login with empty username and password fields.
- Form displays validation errors for required fields.
  
![Negative Outcome - Login with Empty Fields](negative_login_empty.png)

### Positive Outcome (Successful Logout)
- User successfully logs out.
- Redirected to the homepage or login page.
  
![Positive Outcome - Successful Logout](positive_logout.png)

#### Additional Scenarios:

### Logout Redirect
- After logout, verify redirection to the homepage or login page.

- [x] **CONFIRMED**

[Back to Top](#table-of-contents)

---

## Test Case 2: Navigation Links

**Description:**
Test the functionality of navigation links in the header.

**Steps:**
1. Click on each navigation link (Home, Reviews, Bookings, Admin, Notifications, Login/Register, Logout).
2. Verify that the corresponding page loads correctly for each link.

**Expected Results:**

### Positive Outcome (Navigation Link Click)
- Clicking on each link navigates to the respective page.
- Active state (highlighted link) is correctly applied to the current page's link.
  

#### Scenarios and Images:

### Home Link Navigation
- Click on the Home link and verify navigation to the homepage.
  
![Home Link Navigation](positive_navigation_home.png)

### Reviews Link Navigation
- Click on the Reviews link and verify navigation to the reviews page.
  
![Reviews Link Navigation](positive_navigation_reviews.png)

### Bookings Link Navigation
- Click on the Bookings link and verify navigation to the bookings page.
  
![Bookings Link Navigation](positive_navigation_bookings.png)

### Admin Link Navigation (Staff User)
- Log in with staff credentials and click on the Admin link.
- Verify navigation to the admin interface page.
  
![Admin Link Navigation](positive_navigation_admin.png)

### Notifications Link Navigation (Authenticated User)
- Log in and click on the Notifications link.
- Verify navigation to the notifications page.
  
![Notifications Link Navigation](positive_navigation_notifications.png)

### Logout Link Navigation (Authenticated User)
- Log in and click on the Logout link.
- Verify successful logout and redirection to the homepage or login page.
  
![Logout Link Navigation](positive_navigation_logout.png)

### Login/Register Link Navigation (Guest User)
- Click on the Login/Register link.
- Verify navigation to the login/register page.
  
![Login/Register Link Navigation](positive_navigation_login_register.png)

### Negative Outcome (Navigation Link Not Found)
- Attempt to navigate to a non-existent page by modifying the URL directly.
- Verify a 404 error page or appropriate error handling.

[Back to Top](#table-of-contents)

---

## Test Case 3: Edit and Create Review/Comment

**Description:**
Test the functionality of creating and editing reviews and comments.

### Part A: Create Review/Comment

**Steps:**
1. Navigate to a section where users can create a new review or comment.
2. Click on the "Add Review" or "Add Comment" button.
3. Fill in the required fields (e.g., content, rating, title).
4. Submit the form to create the review or comment.
5. Verify that the new review or comment is displayed correctly.

**Expected Results:**

#### Positive Outcome (Successful Creation)
- Form allows submission of new review or comment with required fields.
- Submitted content is displayed correctly in the designated section.

![Positive Outcome - Successful Creation](positive_create_review.png)

#### Additional Scenarios and Images:

### Create with Empty Fields
- Submit the creation form without filling in all required fields (e.g., leaving content field empty).
- Verify that the form displays appropriate validation errors for missing fields.

![Create with Empty Fields](negative_create_empty_fields.png)

### Create with Special Characters
- Create a review or comment containing special characters (e.g., emojis, symbols).
- Verify that the application accepts and displays special characters correctly after submission.

![Create with Special Characters](positive_create_special_characters.png)

### Create with Long Content
- Create a review or comment with a large amount of text exceeding typical limits.
- Verify that the application handles and displays long content properly without truncating or causing display issues.

![Create with Long Content](positive_create_long_content.png)

### Part B: Edit Review/Comment

**Steps:**
1. Navigate to a review or comment section.
2. Find an existing review or comment.
3. Click on the edit button/icon.
4. Modify the content, rating, or title of the review or comment.
5. Submit the edited content.
6. Verify that the updated review or comment is displayed correctly.

**Expected Results:**

#### Positive Outcome (Successful Edit)
- Edit form allows modification of existing review or comment content.
- Submitted changes are reflected correctly in the review or comment section.

![Positive Outcome - Successful Edit](positive_edit_review.png)

#### Additional Scenarios and Images:

### Cancel Edit
- Start editing a review or comment but choose to cancel without saving changes.
- Verify that the content remains unchanged after canceling edit.

![Cancel Edit](negative_cancel_edit.png)

### Edit Empty Content
- Attempt to edit a review or comment by removing all existing content.
- Verify that the form prevents submitting empty content and displays an error.

![Edit Empty Content](negative_edit_empty.png)

### Edit with Special Characters
- Edit a review or comment and include special characters (e.g., emojis, symbols).
- Verify that the form accepts special characters and displays them correctly after submission.

![Edit with Special Characters](positive_edit_special_characters.png)

### Edit Long Content
- Edit a review or comment to include a long text exceeding typical character limits.
- Verify that the form handles and displays long content properly without truncating or causing display issues.

![Edit Long Content](positive_edit_long_content.png)

### Negative Outcome (Unauthorized Edit)
- Attempt to edit a review or comment belonging to another user (if applicable to your application).
- Verify that the application prevents unauthorized edits and displays an error or access denied message.

![Unauthorized Edit](negative_unauthorized_edit.png)

[Back to Top](#table-of-contents)

---

## Test Case 4: Reservation Form

**Description:**
Test the functionality of the reservation form for booking rooms.

**Steps:**
1. Navigate to the Bookings page.
2. Click on the Reserve Room button or link.
3. Fill in the reservation form with different scenarios, including missing required fields.
4. Submit the form and verify the booking process.

**Expected Results:**

### Part A: Reservation Form Submission

#### Positive Outcome (Successful Form Submission)
- Form is filled with valid data.
- Submitting the form successfully reserves the room.

![Positive Outcome - Successful Form Submission](positive_reservation_form.png)

#### Additional Scenarios and Images:

### Empty Fields

#### Negative Outcome (Missing Required Fields)
- Leave one or more required fields (name, email, phone, check-in date, checkout date) empty.
- Form submission triggers validation errors for missing fields.

![Negative Outcome - Missing Required Fields](negative_reservation_missing_fields.png)

### Invalid Date Range

#### Negative Outcome (Invalid Date Range)
- Enter a checkout date that is before the check-in date.
- Form submission triggers a validation error indicating an invalid date range.

![Negative Outcome - Invalid Date Range](negative_reservation_invalid_dates.png)

### Invalid Email Format

#### Negative Outcome (Invalid Email Format)
- Enter an invalid email format (e.g., missing '@' symbol).
- Form submission triggers a validation error for invalid email format.

![Negative Outcome - Invalid Email Format](negative_reservation_invalid_email.png)

### Overlapping Reservations

#### Negative Outcome (Overlapping Reservations)
- Attempt to book a room for dates that overlap with an existing reservation.
- Verify that the form prevents overlapping reservations and displays an error message.

![Negative Outcome - Overlapping Reservations](negative_reservation_overlap.png)

### Additional Scenarios:

#### Form Autofill

- Test form autofill functionality using browser settings.

- [x] **CONFIRMED**

#### Form Reset

- Test the form reset button to clear all entered data.

- [x] **CONFIRMED**

[Back to Top](#table-of-contents)

---

## Test Case 5: Availability Check for Rooms

**Description:**
Test the availability check functionality for booking rooms.

**Steps:**
1. Navigate to the Bookings page.
2. Enter check-in and check-out dates.
3. Click on the availability check or submit button.
4. Verify if rooms are available for the selected dates.

**Expected Results:**

### Part A: Availability Check

#### Positive Outcome (Rooms Available)
- Available rooms are displayed based on the selected dates.
- No availability messages or errors are shown.

![Positive Outcome - Rooms Available](positive_room_availability.png)

#### Additional Scenarios and Images:

### No Rooms Available

#### Negative Outcome (No Rooms Available)
- No rooms are available for the selected dates.
- Availability check displays a message indicating no rooms are available.

![Negative Outcome - No Rooms Available](negative_room_availability.png)

### Overlapping Reservations

#### Negative Outcome (Overlapping Reservations)
- Attempt to book a room for dates that overlap with an existing reservation.
- Verify that the availability check prevents overlapping reservations and displays an error message.

![Negative Outcome - Overlapping Reservations](negative_room_availability_overlap.png)

### Check with Past Dates

#### Additional Scenario (Check with Past Dates)
- Enter check-in and check-out dates that are in the past.
- Verify that the availability check handles past dates appropriately.

![Check with Past Dates](positive_room_availability_past_dates.png)

### Check with Future Dates

#### Additional Scenario (Check with Future Dates)
- Enter check-in and check-out dates that are in the future.
- Verify that the availability check handles future dates without errors.

![Check with Future Dates](positive_room_availability_future_dates.png)

### Additional Scenarios:

#### Availability Check Performance

- Test the availability check performance with a large dataset of rooms and bookings.

- [x] **CONFIRMED**

#### Availability Check Reset

- Test the availability check reset button to clear entered dates and reset the form.

- [x] **CONFIRMED**

[Back to Top](#table-of-contents)

---

# Validation Results

## Description

All validations for views, URLs, and models across the applications (Bookings, Reviews, Hotel, and Home) were successful. Each section below provides detailed validation results for each component.

## Table of Contents

- [Bookings App](#bookings-app)
  - [Views](#views)
  - [URLs](#urls)
  - [Models](#models)
- [Reviews App](#reviews-app)
  - [Views](#views-1)
  - [URLs](#urls-1)
  - [Models](#models-1)
- [Hotel App](#hotel-app)
  - [Views](#views-2)
  - [URLs](#urls-2)
  - [Models](#models-2)
- [Home App](#home-app)
  - [Views](#views-3)
  - [URLs](#urls-3)
  - [Models](#models-3)
- [HTML Files](#html-files)
- [CSS Validation](#css-validation)
- [JavaScript (JS) Validation](#javascript-js-validation)
- [Lighthouse Reports](#lighthouse-reports)

---

## Validator Used

- **Validator:** PEP8CI Validator
- **Link to Validator:** [PEP8CI Validator](https://pep8ci.herokuapp.com/#)

---

## Bookings App

### Views

All views in the Bookings app passed validation.

![Bookings Views Validation](path_to_bookings_views_image.png)

[Back to Top](#table-of-contents)

### URLs

All URLs in the Bookings app passed validation.

![Bookings URLs Validation](path_to_bookings_urls_image.png)

[Back to Top](#table-of-contents)

### Models

All models in the Bookings app passed validation.

![Bookings Models Validation](path_to_bookings_models_image.png)

[Back to Top](#table-of-contents)

---

## Reviews App

### Views

All views in the Reviews app passed validation.

![Reviews Views Validation](path_to_reviews_views_image.png)

[Back to Top](#table-of-contents)

### URLs

All URLs in the Reviews app passed validation.

![Reviews URLs Validation](path_to_reviews_urls_image.png)

[Back to Top](#table-of-contents)

### Models

All models in the Reviews app passed validation.

![Reviews Models Validation](path_to_reviews_models_image.png)

[Back to Top](#table-of-contents)

---

## Hotel App

### Views

All views in the Hotel app passed validation.

![Hotel Views Validation](path_to_hotel_views_image.png)

[Back to Top](#table-of-contents)

### URLs

All URLs in the Hotel app passed validation.

![Hotel URLs Validation](path_to_hotel_urls_image.png)

[Back to Top](#table-of-contents)

### Models

All models in the Hotel app passed validation.

![Hotel Models Validation](path_to_hotel_models_image.png)

[Back to Top](#table-of-contents)

---

## Home App

### Views

All views in the Home app passed validation.

![Home Views Validation](path_to_home_views_image.png)

[Back to Top](#table-of-contents)

### URLs

All URLs in the Home app passed validation.

![Home URLs Validation](path_to_home_urls_image.png)

[Back to Top](#table-of-contents)

### Models

All models in the Home app passed validation.

![Home Models Validation](path_to_home_models_image.png)

[Back to Top](#table-of-contents)

---

## HTML Files

### Comments Approval List (comments_approval_list.html)

Validation of comments_approval_list.html was successful.

![Comments Approval List Validation](path_to_comments_approval_list_image.png)

[Back to Top](#table-of-contents)

### Review Approval List (review_approval_list.html)

Validation of review_approval_list.html was successful.

![Review Approval List Validation](path_to_review_approval_list_image.png)

[Back to Top](#table-of-contents)

### Reservation Approval List (reservation_approval_list.html)

Validation of reservation_approval_list.html was successful.

![Reservation Approval List Validation](path_to_reservation_approval_list_image.png)

[Back to Top](#table-of-contents)

### Admin Interface (admin_interface.html)

Validation of admin_interface.html was successful.

![Admin Interface Validation](path_to_admin_interface_image.png)

[Back to Top](#table-of-contents)

### Signup Page (signup.html)

Validation of signup.html was successful.

![Signup Page Validation](path_to_signup_image.png)

[Back to Top](#table-of-contents)

### Check Availability Page (check_availabilty.html)

Validation of check_availabilty.html was successful.

![Check Availability Page Validation](path_to_check_availabilty_image.png)

[Back to Top](#table-of-contents)

### Rooms Page (rooms.html)

Validation of rooms.html was successful.

![Rooms Page Validation](path_to_rooms_image.png)

[Back to Top](#table-of-contents)

### Book Room Page (book_room.html)

Validation of book_room.html was successful.

![Book Room Page Validation](path_to_book_room_image.png)

[Back to Top](#table-of-contents)

### Edit Comment Page (edit_comment.html)

Validation of edit_comment.html was successful.

![Edit Comment Page Validation](path_to_edit_comment_image.png)

[Back to Top](#table-of-contents)

### Edit Review Page (edit_review.html)

Validation of edit_review.html was successful.

![Edit Review Page Validation](path_to_edit_review_image.png)

[Back to Top](#table-of-contents)

### Reviews Page (reviews.html)

Validation of reviews.html was successful.

![Reviews Page Validation](path_to_reviews_image.png)

[Back to Top](#table-of-contents)

### Review Details Page (review_details.html)

Validation of review_details.html was successful.

![Review Details Page Validation](path_to_review_details_image.png)

[Back to Top](#table-of-contents)

### Home Page (home.html)

Validation of home.html was successful.

![Home Page Validation](path_to_home_image.png)

[Back to Top](#table-of-contents)

---

## CSS Validation

### Validator Used: [W3C CSS Validator](https://jigsaw.w3.org/css-validator/)

#### Validation Result Image
![CSS Validation Result](path_to_css_validation_image.png)

[Back to Top](#table-of-contents)

---

## JavaScript (JS) Validation

### Validator Used: [JSHint](https://jshint.com/)

#### Validation Result Image
![JavaScript (JS) Validation Result](path_to_js_validation_image.png)

[Back to Top](#table-of-contents)

---

## Manual Testing: Handling 404 Errors

### Description
This section details the manual testing steps to ensure proper handling of 404 errors across the application.

### Steps to Test 404 Error Handling

1. [ ] **Access Invalid URL:**
   - Navigate to a non-existent URL on the application (e.g., `https://8000-nlekkerman-hotelwantit-72nhvj2byqt.ws.codeinstitute-ide.net/accounts/loin/`).

2. [ ] **Verify Error Page Display:** 
   - Check that the application displays a user-friendly 404 error page.

3. [ ] **Verify Navigation and Messaging:**
   - Ensure the error page provides clear messaging about the page not being found.
   - Verify that the error page includes navigation options to return to the homepage or other relevant sections.

4. [ ] **Check Error Handling in Different Scenarios:**
   - Repeat steps 1-3 for different types of invalid URLs (e.g., mistyped URLs, outdated links).

5. [ ] **Check Consistency Across Devices:**
   - Test the 404 error handling on various devices (desktop, tablet, mobile) to ensure consistency in appearance and functionality.
   ![404 Error Page Mobile View](path_to_404_error_page_mobile_image.png)

6. [ ] **Verify Error Logging (if applicable):**
   - If the application logs 404 errors, check the logs to confirm that appropriate errors are logged with relevant details (timestamp, URL, user agent).

### Expected Results

- The application should consistently display a well-designed 404 error page with clear messaging.
- Navigation options back to the homepage or relevant sections should be prominently displayed.
- Error handling should be consistent across different devices and scenarios.

### Notes

- If there are specific edge cases or additional considerations for 404 error handling in your application, mention them here.
- Document any observed deviations from expected behavior or issues encountered during testing.

[Back to Top](#table-of-contents)
