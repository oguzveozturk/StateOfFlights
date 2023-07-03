#  # Table of Contents
1. [Description](#description)
2. [Getting started](#getting-started)
3. [Usage](#usage)
4. [Arhitecture](#arhitecture)
5. [Structure](#structure)
6. [Running the tests](#running-the-tests)
7. [Deployment](#deployment)
8. [Dependencies](#dependencies)
9. [Task board](#task-board)
10. [Design](#design)
11. [API](#api)

# StateOfFlights
A simple project that shows flight states on the map.

# Description
<p>The user can drag the map to view active flights from opensky API. By clicking on the aircraft, they can obtain the ICAO24 code and origin country information. The flights can be filtered by origin country using the list at the bottom of the screen.</p>

# Getting started
<p>
1. Make sure you have the Xcode version 14.0 or above installed on your computer.<br>
2. Make sure iOS or iPadOS version 16.0 or above.<br>
2. Download the StateOfFlights project files from the repository.<br>
3. Open the project files in Xcode.<br>
4. Run the StateOfFlights scheme.<br>

# Usage
In order to get flights you need an account from opensky. But for the simplicty project contains a dummy account information

# Architecture
* StateOfFlights project is implemented using the <strong>VIPER</strong> architecture pattern.
* All the logic is handled within the presenter..<br>

# Structure
* "StateOfFlights": Begining of the app.Contains AppDelegate, AppRouter and AppContainer. 
* "FlightsMap": A draggable map displaying the real-time status of flights.".
* "CountrySelector": Builted with UISheetPresentationController. The Table below the screen allows the user to select the origin country.
* "FlightAPI": Files or classes related to communicating with an external API. This could include code for making HTTP requests to a web server, parsing responses, and handling any errors that may occur.
* "CommonViews": Reusable UI elements.
* "Common": Files or resources that are shared across multiple parts of the project. Such as utility classes, global constants or extensions.

# Running the tests
<p>The StateOfFlights project can be tested using the built-in framework XCTest.<br>
Just select the testing tab and press start.<br>

# Dependencies
[SPM] is used as a dependency manager.
List of dependencies: 
* 'Alamofire' -> Networking library that ensures that the message reaches everyone in the world.

# Workflow

* Reporting bugs:<br> 
If you come across any issues while using the StateOfFlights, please report them by creating a new issue on the GitHub repository.

* Reporting bugs form: <br> 
```
App version: 2.12
iOS version: 16.1
Description: When I tap on the "Send" button, my friends don't receive message.
Steps to reproduce: Open "Messages" flow of the app, write down message, press "Send" button.
```

* Submitting pull requests: <br> 
If you have a bug fix or a new feature you'd like to add, please submit a pull request. Before submitting a pull request, 
please make sure that your changes are well-tested and that your code adheres to the Swift style guide.

* Improving documentation: <br> 
If you notice any errors or areas of improvement in the documentation, feel free to submit a pull request with your changes.

* Providing feedback:<br> 
If you have any feedback or suggestions for the StateOfFlights project, please let us know by creating a new issue or by sending an email to the project maintainer.

# API 
* We are using a REST API from OpenSky-Network
* List of API calls is [here](https://openskynetwork.github.io/opensky-api/) 
* For HTTP networking we are using [Alamofire](https://github.com/Alamofire/Alamofire) 


