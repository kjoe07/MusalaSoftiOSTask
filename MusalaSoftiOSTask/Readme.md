#  Practical ios task for Hiring process.
iOS Code challenge for the musala soft compay

## Challenge
Create a native iOS application written in Swift and/or Objective-C
Application should give you information about the weather forecast for three big cities (New York, Tokyo and Sofia).
Use the https://www.metaweather.com/api/ API to get the information for each city.
WOEIDs to use:
1. Sofia -  839722
2. NY - 2459115
3. Tokyo - 1118370

## Task list:
1. List the cities and option to select a given city.
2. When a city is selected, you should list all the forecast days for the selected city.
3. When selecting a day, you should list all the information for that day.
4. Handle all possible errors and scenarios.
5. Use the corresponding icons from the API based on the weather conditions.
6. No limitation of the used UI elements.
7. The implementation of the UI must use Auto layout and looks good on all the available iOS devices in both landscape and portrait orientation.
8. Write the applications as you would do it if you were already in the company.


## Bonus tasks:

1. Save the data and provide offline functionality.
2. Functionality to add new WOEIDs
3. Make build targets for dev/test/ua/production


### Process
the task was created in Xcode13 with swift 5. only 2 deendencies were used, with Swift Package Manager.

clone the project, update dependencies and run in simulator or sing in to run on iPhone or iPad.
the app is running both landscape and portrait, offline support s partial only for city list and day forecast list. Persistence is achived with CoreData. 


