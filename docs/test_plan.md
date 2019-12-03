---
id: test_plan
title: Test Plan
sidebar_label: Test Plan
---

**TC01: Login Page**

A user should be able to succesfully login at http://war.marist.ai 

Preconditions: 
The user has already signed up via the Sign Up Page.
The user has valid Marist credentials.

Test Steps:
1. Navigate to http://war.marist.ai
2. Enter credentials via Marist Authentication Service 
3. Press the Login Button

Expected Result:
The user will be directed to the main reviewing dashboard of the system. 

**TC02: Submitting a review as correct**

Preconditions:
The user has successfully signed into the system. 

Test Steps: 
1. The user will read the sentence displayed. 
2. The user will press the correct button. 

Expected Result:
The next sentence up for review appears. The user will be notified if no more sentences are available for review. 

**TC03: Submitting a review as incorrect**

Preconditions:
The user has successfully signed into the system. 

Test Steps: 
1. The user will read the sentence displayed. 
2. The user will press the incorrect button. 
3. The user will check off which rule(s) the sentence violates. 
4. The user will press the submit button. 

Expected Result:
The next sentence up for review appears. The user will be notified if no more sentences are available for review.

**TC04: Viewing rules**
Preconditions:
The user has successfully signed in to the system.

Test Steps: 
1. The user will click on the rule dropdown they want to read. 

Expected Result:
A description of the associated rule appears. 

**TC05: Log out**
Preconditions:
The user has successfully signed in. 

Test Steps: 
1. User presses the log out icon at the top right of the screen. 

Expected Result:
The user will see a confirmation they have sucessfully logged out of the Marist Authentication service. The user is logged out of the system. 
