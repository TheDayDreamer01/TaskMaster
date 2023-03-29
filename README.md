# TaskMaster

### Project Overview

`TaskMaster` is a comprehensive to-do list mobile application designed to help individuals and teams organize, manage, and complete tasks more efficiently. The application offers a user-friendly interface that makes it easy for users to create, track, and prioritize tasks. With `TaskMaster`, users can collaborate with others, set reminders, and track progress to ensure that they meet their goals and deadlines.

## Project Objectives

1. `Task Management`: The primary objective of TaskMaster is to help users manage their tasks more effectively. The application provides users with the tools they need to create, assign, and prioritize tasks so that they can stay on top of their to-do list and achieve their goals.

2. `Collaboration`: TaskMaster also aims to facilitate collaboration among teams. Users can share their tasks with others, assign tasks to team members, and receive notifications when tasks are completed, allowing for greater accountability and teamwork.

3. `Reminders and Notifications`: TaskMaster's built-in reminder and notification system ensures that users never miss a deadline or forget a task. Users can set reminders for specific tasks, receive notifications when tasks are due or completed, and get alerts for upcoming deadlines.

4. `Customization`: TaskMaster offers a high degree of customization, allowing users to tailor the application to their specific needs. Users can create custom task lists, labels, and tags, and use filters to sort and organize their tasks.

5. `Productivity Tracking`: TaskMaster provides users with the ability to track their productivity and progress over time. Users can view completed tasks, measure their performance, and identify areas for improvement, helping them to increase their efficiency and effectiveness.


### Project Features

Here are 20 features for TaskMaster that are relatively essential for a mobile Todo List Application:

1. Task creation and editing
2. Task completion tracking
3. Task priority settings
4. Task categorization and tagging
5. Task notes and comments
6. Task due dates and reminders
7. Recurring tasks
8. Task search and filter options
9. Sorting tasks by due date, priority, or category
10. Task sharing with other users
11. Integration with third-party calendars
12. Customizable task list views
13. Dark mode and other color theme options
14. User profile settings and preferences
15. Backup and restore data options
16. Task import and export features
17. Multi-device synchronization
18. Push notifications for important tasks
19. Task archive and delete options
20. In-app help and support features

### Project Program Flow

Here is a program flow for TaskMaster, a Todo list application:

1. On app launch, the user is presented with the login screen, where they can either log in with an existing account or create a new account.

2. After successful login, the user is taken to the home screen, which displays their task lists and the option to create a new task list.

3. The user can select a task list to view its tasks. Each task can be edited, marked as completed, or deleted.

4. To create a new task, the user can click the "Add Task" button, which opens a form where they can enter the task details, such as title, description, due date, and priority.

5. The user can also assign a task to another user by selecting their name from a list of users, or by entering their email address if they are not already registered in the app.

6. If the user has notifications enabled, they will receive a push notification when a task is due.

7. The user can view their completed tasks by selecting the "Completed Tasks" option from the menu.

8. The user can also search for tasks by keyword, filter tasks by due date or priority, and sort tasks by various criteria.

9. The user can customize the app's theme and settings, such as font size, notification settings, and language preferences.

10. To collaborate with other users, the user can invite them to join a task list, which will give them access to view and edit the tasks in that list.

11. The user can also synchronize their data between multiple devices using a cloud-based storage service, such as Firebase Cloud Firestore.

12. If the user logs out of the app, their data is securely stored locally on their device using Hive, and can be accessed again when they log back in.

## Flutter Packages

Here are the packages that are needed for the 20 features of TaskMaster in Flutter using provider, shared_preferences, firebase, and hive:

1. `provider`: Used for state management and sharing data between widgets.
2. `shared_preferences`: Used for storing and retrieving simple data such as task lists, notes, and preferences.
3. `firebase_core`: Used for configuring Firebase services in the app.
4. `cloud_firestore`: Used for storing and retrieving more complex data such as user accounts, task assignments, and comments.
5. `firebase_auth`: Used for user authentication and authorization.
6. `intl`: Used for formatting dates and times based on the user's locale.
7. `flutter_datetime_picker`: Used for selecting due dates and times for tasks.
8. `flutter_slidable`: Used for adding swipe actions to task items, such as marking them as completed or deleting them.
9. `flutter_staggered_animations`: Used for displaying task lists in a grid layout.
10. `animated_text_kit`: Used for animating text elements in the app, such as task titles and labels.
11. `flutter_speed_dial`: Used for creating floating action buttons that provide quick access to frequently used tasks.
12. `flutter_svg`: Used for displaying SVG icons and images in the app.
13. `hive`: Used for fast and lightweight local data storage.
14. `path_provider`: Used for accessing the device's file system for local data storage.
15. `connectivity`: Used for checking the device's internet connectivity status.
16. `firebase_messaging`: Used for receiving push notifications from Firebase Cloud Messaging.
17. `firebase_analytics`: Used for tracking user interactions with the app for analytics purposes.
18. `Google_fonts`: Used for displaying custom fonts in the app.
19. `flutter_keyboard_visibility`: Used for detecting when the keyboard is visible to adjust the layout of the app accordingly.

