# krs_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


///////////////////////////////////////////////////////////////////////////////////

C.1 Thinking Questions :
    1. Why does each flutter screen ussualy use Scaffold?
        Answer: Without Scaffold, our page will just be a messy blank black screen. Scaffold makes our page structure neat and similar to standard Android applications.

    2. What happens if Navigator.pop(context) is called in HomeScreen?
        Answer: Consequence: If I press the “Back” button on the first page, the application will close or exit or the screen will turn black or blank because there are no more pages to display. The application is confused, Where should I go back to? Theres nothing left.

    3. Are these two MaterialPageRoute implementations equivalent? Wh?
        Answer: I think it's the same: Computers don't care which one i use, the result is the same. It's just that for programmers, using arrows (=>) is usually easier on the eyes when the code is short.

    4. When should a screen use StatefullWidget instead of StatelessWidget?
        Answer: I use select StatelessWidget its like (Poster):
        If the page content is fixed and will not change after being displayed.
        Examples: About Us page, app icons, or title text. Once displayed, the form remains unchanged.

        I choose StatefulWidget its like (Whiteboard/Scoreboard):
        If the page content can be change when the user does something.

        Examples: Counter page numbers increase when clicked, Checkbox from empty to checked, or Input Field letters appear when typed.

C.2 Debugging Challenge
    Tasks: 
    1. Run the app and observe the error
    2. Fix the code
    3. Explain:
        - What error occured
            Answer: When the application is running and i press the Login button on the home page, i will enter the Dashboard. However, on the Dashboard, the button says “Open KRS” and when i pressed, it immediately jumps to the KRS Page.

            The problem: The Profile page is skipped. The flow should go to Profile first before going to KRS.

        - Why it hapenned
            Answer: I think thtat in the Navigator.push function in the dashboard_screen.dart file, the page target (“builder”) is directed to KrsScreen(), not ProfileScreen(). This may have occurred due to incomplete code.

        - How you fixed it
            Answer: I changed the MaterialPageRoute target in DashboardScreen to call ProfileScreen(). I also changed the button text from open krs to open profile to match ist function.


C.3 Design decision task
    Create a ProfileScreen with:
    - Any AppBat title
    - At least 3 widgets in the body
    - Any layout

    Explainataion :
    1. Why i choose these widgets
            Answer: I used a round profile photo to make it look more modern and friendly, arranged the information vertically to make it look neat, and chose prominent buttons so that users would immediately know the next step.

    2. Why i arrange them that way
        Answer: Because most of the people read profiles in a specific pattern:
        Visual Identity like Photo: At the top and largest so that it is immediately recognizable. 
        Identity like Name: Below the photo in a font larger than the other details. 
        Details such as Student ID Number: Below the name in a standard font. 
        Action like example (Button): I placed at the bottom as the next step after the user reads the information above it.

    3. How this screen could evolve in a real KRS system
        Answer: I think in the future, the application must be connected to the campus database so that important data (like GPA and payment status) appears automatically and students can edit their own profiles.

## Reflection
    1. Hardest part this week : In my opinion, the most difficult part is understanding the concepts of Navigation.
    Navigation: At first, the concept of stacking pages with Navigator.push and pop can be confusing. I often get lost determining when to push (add to stack) and when to pop (remove from stack), or why the back button on output suddenly closes the application instead of returning to the previous menu.

    2. Errors encountered: 
    There are three main errors we encountered in this session:
    Version Constraint Error: The application cannot be run because the SDK version in pubspec.yaml is written as ^3.9.2. This is too high and specific, so it does not match the standard Flutter installation on most computers.

    Directory Error: Message Expected to find project root in current working directory. This occurs because the flutter pub get command is run outside the original project folder.

    Logical Error: In DashboardScreen, the button says Open KRS and when clicked, it skiped directly to the KRS page. However, according to the KRS system flow design, it should first go to Profile for self validation before going to KRS.

    3. How i fixed them :
     Fix Version: I edit the pubspec.yaml file and change the environment sdk line to be more flexible: sdk: ‘>=3.0.0 <4.0.0’.

    Fix Directory: My solution is to use the cd krs_app command in the terminal to enter the folder containing the pubspec.yaml file before running other Flutter commands.

    Fix Logic: I dissect dashboard_screen.dart, change the button text to “Open Profile”, change the navigation target to ProfileScreen(), and ensure that the import profile_screen.dart is correct.

    4. Remaining questions : 
        “How do i make sure the data isn't fake or hardcoded? How do i connect to the campus MySQL/API database?”



D. HOMEWORK WEEK 4
 Assignment Answers 

 C.1 Thinking Questions

  Why can’t StatelessWidget use setState()?
    Answer: Because `StatelessWidget` is “fixed” or static. It's like a poster on the wall: once it's printed and hung up, the image can't change on its own. `setState()` is a tool for “redrawing” the screen, and `Stateless` doesn't have that tool because it's designed for static (fixed) displays.

  What happens if setState() is removed from the button?
    Answer: The data changes in the computer's brain (the variable increases), but the screen doesn't change. So the user sees that the SKS number is still 0, when in fact it may already be 3 or 6. `setState` is like telling a painter to repaint the wall so that the changes are visible to the eye.

  Why is KrsDetailScreen better as StatelessWidget?
    Answer: Because the KRS detail page usually only displays information (reads data), there are no calculation buttons or data input that cause the screen to change constantly. To make the application lighter, just use `Stateless`.

 What kind of data should NOT be stored as state?
    Answer: Data that will not change (such as a static application logo) or data that is too heavy and does not directly affect the display at that moment (for example, the entire contents of the campus student database). Only store data that needs to be displayed on the screen at that moment in the state.

C.2 Debugging Challenge

Error Code:
`selectedCredits = selectedCredits + “3”;`

 Identify the error:
The error is in the quotation marks around the number “3”. The computer interprets it as text (string), not a number (integer).

 Fix the code:
`selectedCredits = selectedCredits + 3;` (Remove the quotation marks).

 Explain why the error occurred:
Because of the quotation marks, the computer thinks we want to connect the words. So if the initial credits are 0, adding “3” makes it “03” (text), not 3 (mathematics). Numbers should meet numbers so they can be added together.

 C.3 Design Decision Task

Enhance KRS screen:
I added a “Take” button that can be changed to “Cancel,” and validation so that credits cannot be negative.

 Why is validation needed?
    Answer: So that it makes sense. How can a student take a course but have negative credits? Validation ensures that the data remains logical, for example, a minimum of 0 credits and a maximum of 24 credits.

 How does state protect UI consistency?
    Answer: State ensures that what the user sees (UI) is exactly the same as the data in the application memory. If the data changes to 3 credits, State forces the UI to display the number “3.” So there is no situation where the data has increased but the screen is still blank.

Reflection (Week 4)

  What confused me this week:
    Honestly, it's a bit confusing to know when to use curly braces `{}` inside a function, and the concept of `setState`, which sometimes, if you forget to write it, doesn't cause an error but the application doesn't work properly.

 How state changed UI behavior:
    The application feels “alive.” Before, it was like opening a PDF file (just static), but now it can interact like a calculator. Pressing a button can change the text on the screen immediately.

 Errors I faced and solutions:
    I once got a “Type Mismatch” error because I wanted to add text to a number variable. The solution was to check the data type again; numbers must be `int`, text must be `String`.

 Differences between Stateful and Stateless:
    Stateless: Like a poster. Created once, displayed, done. Saves memory. Suitable for title text or icons.
    Stateful: Like a whiteboard. Can be written on, erased, and written on again. Suitable for login forms, checkboxes, or SKS counters.

