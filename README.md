# Study Mate

## Overview
### Description
An iOS application for finding study partners.


## Wireframes

<img width="882" alt="Screen Shot 2022-04-02 at 2 47 57 PM" src="https://user-images.githubusercontent.com/67254834/161397133-31bc5e37-a3f1-4190-80f4-eaa81bffcb30.png">

## Schema 
### User 

| Property  | Type | Description |
| ------------- | ------------- | ------------- |
| ObjectID  | String  | unique ID for each user profile |
| Image  | File  | Image that the user uploads for their profile |
| Biography  | String  | Description of User with additional information |
| Name  | String  | Name of user |
| Year  | Boolean  | Class year of user |
| Major  | Boolean | Major of User |
| University | String | University of User |
| Preferences  | Boolean  | User preferences for filter |
| Connections  | Pointer to User | After swiping right, they become a connection |


### Messaging

| Property  | Type | Description |
| ------------- | ------------- | ------------- |
| ObjectID  | String  | unique ID for each user message chat |
| MessageID  | String  | unique ID for each message from User |
| createdAt | DateTime  | The time the message was sent |
| MessageString | String  | The message the user has sent |

### Networking Requests

### List of network requests by screen

#### Login Screen
--
* (POST) Create a new user on sign up
* (GET) If username and password match get the user and sign in

#### Home Screen
--
* (GET) Get all users based on the users preference filter {byYear, myMajor, or Any}
* (POST) Add connection to a user when they swipe right
* (DELETE) Remove suggested connection when swipe left

#### Message Screen
--
* (POST) Create a new message
* (GET) Retrieve all previous messages every time view loads

#### Profile Screen, Profile View, and Editing View
--
* (PUT) Change the user's name, image, major, bio, etc.
* (GET) Get all current  user info every time view loads
 
## Finished Product 
Here's a walkthrough of implemented user stories & more:
[StudyMate Walkthrough!](https://drive.google.com/file/d/1Megx8k5FyD07QyawMqsTHA-TWJPyd9Em/view?usp=sharing)
