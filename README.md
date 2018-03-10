# SmartThingsWebAPP
A customizable SmartThings web app for mobile devices

## Executive Summary
The Samsung SmartThings Android application is good for basic tasks but lacks customizable interfaces and advanced rules for SmartThings actions. The SmartThingsWebAPP can be used to integrate existing SmartThings devices into a customizable interface designed to work inside a hybrid Android application.

## Project Goals
* Develop an Android hybrid applicaton
* Create a simple and intuitive user interface
* Interact with SmartThings API to show current configured SmartThings devices
* Create new routines, or actions for SmartThings devices
* Add advanced configuration items
* Add at least 2 user interfaces switchable by user

## User stories
As an **application user**, I want to **change the app UI** so I can **see the app how I like it**.

**Acceptance Criteria:**
* A setting or switch must exist to modify the UI
* At least 2 UI must exist for user to swtich between

As an **applcation user**, I want to **modify SmartThings actions/routines to only work at certain times of day** so I can **turn on the lights only if its dark outside**

**Acceptance Criteria:**
* SmartThings device action must accept time as arguments

As an **guest**, I want to **not use the app** so I don't **have to sign into SmartThingsWebAPP to use them**
* The app must be available from local wifi as as website with limited functionality

## Misuser stories
As a **hacker**, I want to **use the SmartThingsWebAPP to modify SmartThings actions/routines** so I can **break into someones house**

**Mitigations**
* The SmartThingsWebAPP must use a Samsung SmartThings API token to authenticate to SmartThings devices

As a **malicious user**, I want to **exploit the SmartThingsWebAPP guest access** so I can **steal location information of users**

**Mitigations:**
* The guest acces will only be available from local WiFi, or other whitelisted locations

## High Level Design
![Component diagram](https://www.lucidchart.com/publicSegments/view/1910ba9f-058b-4758-a457-847c3c7684d3/image.jpeg)

## Component List
### Software Components
#### Android Applicaiton - SmartThingsWebAPP
The Hybrid Android Application for the phone

#### Daylight web service
This web service will be used to track if it is daylight for advanced SmartThings actions/routines

#### SmartThings API
SmartThings API for interfacing with hardware components such as SmartThings hub or Phillips hue lightbulbs https://smartthings.developer.samsung.com/

#### Guest access web page
A web page which is unauthenticated to provide access to a limited set of SmartThings devices. This will be limited to whitelisted networks.

### Hardware Components
#### Web server
Hosts the content and makes API calls to SmartThings and other web services

#### Android phone
Runs the SmartThingsWebAPP and sends instructions to the web server

#### SmartThings hub
The on premise hardware interface for the SmartThings Applicaiton

#### Phillips Hue lightbulbs
WiFi enabled light bulbs which can be controlled by SmartThings

## Security analysis
Text describing high level diagram with red or other callouts identifying problem points or attacks.

| Component name | Category of vulnerability | Issue Description | Mitigation |
|----------------|---------------------------|-------------------|------------|
| SmartThings API | Unauthorized Access | This application exposes API endpoints for SmarthThings which could be used malicioulsy.  | The API endpoints will require an API token to prevent misuse.|
| Guest Access | Access to unauthoized devices | The guest access site will provide unauthenticated access to a set of devices | Certain devices will only be available to authenticated users (with the Android App)  |
| Web Server | Denial of Service | The web server could be affected by a Denial of Service attack | Access will be whitelisted for guests and authenticated for application users |
