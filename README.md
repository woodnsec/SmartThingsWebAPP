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
![Component diagram](https://www.lucidchart.com/publicSegments/view/69d74ba6-b80e-45f1-8713-892471aa1c4a/image.png)

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

# Installation
## Hardware requirements
* SmartThings Hub and Samsung account will be required to use this SmartApp.
* Web server with valid web certificate (HTTPS will be used by SmartThings API).
* Smart lighting or switches to command with this SmartApp.

## Software requirements
* SmartThings Classic or SmartThings Android or iOS Application
*
## Setup web Server
1. Running this application requires [Docker](https://www.docker.com/).  Once Docker is running, build the image as follows.
```bash
git clone --recursive https://github.com/woonat01/SmartThingsWebAPP.git
cd SmartThingsWebAPP
docker-compose build
```
2. Once the image is configured, it can be run using the following command
```bash
docker-compose up
```
3. Go to the [Automation](https://devworkspace.developer.samsung.com/smartthingsconsole/iotweb/site/index.html#/development/automation) section of the Developer Workspace and create an Automation.
	- For the **SmartApp Type** select **WebHook endpoint** and enter the https URL of your webserver (note this has to be an HTTPS address).
	- For the **Scope**, click on **Settings** and select the following scopes:
    - `l.deviceStatus`,
    - `r:devices:*`,
		- `x:devices:*`,
		- `r:schedules`, and
		- `w:schedules`
	- Click **SAVE AND NEXT**.
	- In the next screen you will be presented with the **Public Key**.

4. Copy this public key and replace the contents of the file `backend/toeknST.txt` with it.
5. Click **CONFIRM** to register your automation in self-publishing mode.
6. Create an API key with [Open Weather Map](https://api.openweathermap.org) (free tier is fine), and store it in a file `backend/tokenWeather.txt`.
7. Stop the Docker container: `CTRL-C`.
8. Start the Docker container again: `docker-compose up`
9. Install the SmartApp in the SmartThings mobile app (go to Marketplace->SmartApps->My Apps-Weather Aware Lighting.
10. Enter all required inputs on the configuration screens.
11. Once installed the SmartApp will monitor your desired presence sensor and turn on the lights designated during setup.
