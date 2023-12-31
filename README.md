Movie List App
==============

This Movie List App is built using clean code principles inspired by [Uncle Bob](https://blog.cleancoder.com/) (Robert C. Martin) and follows the [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel) (Model-View-ViewModel) architecture pattern. The app leverages [Combine](https://developer.apple.com/documentation/combine) for handling asynchronous events and data flow.

Clean Code Principles
---------------------

This project follows clean code principles inspired by [Uncle Bob](https://blog.cleancoder.com/) (Robert C. Martin). Clean code emphasizes readability, maintainability, and the organization of code for better software development. It helps create a codebase that is easy to understand and maintain.


Technologies Used
-----------------

### MVVM (Model-View-ViewModel) Architecture

MVVM is an architectural pattern that separates an application into three components: Model, View, and ViewModel. It encourages the separation of concerns and promotes a clean codebase by isolating business logic from the user interface. Learn more about MVVM [here](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel).

### Combine Framework

Combine is a framework introduced by Apple that provides a declarative Swift API for processing values over time. It's used in this app for managing asynchronous operations, event handling, and data flow, enhancing the reactivity and maintainability of the codebase. Explore Combine [here](https://developer.apple.com/documentation/combine).

Unit Tests
----------

This project includes a comprehensive suite of unit tests to ensure the reliability and correctness of the code. Unit tests are an integral part of the development process and play a crucial role in maintaining code quality and functionality. These tests are designed to validate various components and functions within the application, helping to identify and prevent potential issues.

Getting Started
---------------

### Prerequisites

*   Xcode (Ensure Xcode is installed)
*   CocoaPods (You can install it via RubyGems: `gem install cocoapods`)

### Installation and Run

1.  Open your terminal.
2.  Install project dependencies using CocoaPods by running the following command:
    
        pod install
    
3.  Open the project workspace by running:
    
        open YassirAssessment.xcworkspace
    
4.  Change the scheme to "NetworkKit" by selecting it from the Xcode toolbar.
5.  Build "NetworkKit" by clicking on the "Product" menu and selecting "Build".
6.  Change the scheme to "MoviesApp" by selecting it from the Xcode toolbar.
7.  Press the "Run" button to build and run the Movie List App on your simulator or device.

Customization
-------------

You can customize the app by changing the token and controlling logging for NetworkKit from the App delegate. Be sure to explore the App delegate for these options.

License
-------

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
