# earnipay
A new Flutter assessment.

#Unsplashed
#Part 1:To run the application
-Clone the  rep on your local machine using the command below:
git clone https://github.com/Joezzy/earnipay_unsplashed.git

-To get all dependencies run:
Flutter pub get

-To run application :
Flutter run



#Part 2:To run the unit test
-Open your terminal and navigate to the root of the project
- Run the command :
  flutter test test/repo/imageRepository_test.dart


#Part 3:   Performance Optimization
Data caching:
This mechanism  limit how often you send a request to the API endpoints, this helps to minimize resources and also increases
response time for users.

Lazy Loading:
This  technique reduce the amount of data you receive and render at a time, only necessary data are rendered. This  implementation in an application that deals with large data help to avoid  runtime crashes due to handling large data and also increase response time and user experience.

Refactoring widgets/code components
-Widgets are broken down into smaller stateless widget which reduces rendering time  and also adding “const” keyword where necessary
-Using” for…loop” statement instead of the f”orEach” statement
-Remove all unused imports in the project


#Others.
State management library is GetX
Http client uses its Dio
Mocktail for Unit test 
