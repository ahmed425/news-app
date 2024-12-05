# News App - Flutter MVC Architecture

## Project Description

This is a **News App** built with **Flutter**, demonstrating the use of the **MVC (Model-View-Controller)** architecture. The app fetches real-time news from an external API and displays the articles in a user-friendly interface. It opens news URLs in an in-app browser using the `url_launcher` package.

Key features:
- Fetches news articles from a public API.
- Displays news details, including title, description, and images.
- Opens the full article in an in-app browser when a news item is tapped.

### App Demo

Here is a demo showing the app in action:

![App Demo](https://imgur.com/a/uYvwqbl)

## MVC Architecture Explanation

This project follows the **MVC (Model-View-Controller)** pattern to separate the concerns of data, presentation, and logic:

- **Model**: Defines the data structure (e.g., `News` class) and interacts with the external API to fetch news data.
- **View**: Contains the Flutter widgets responsible for displaying the news content. This is done through the `NewsView` widget.
- **Controller**: Handles the business logic and connects the `Model` to the `View`. It manages fetching data and controlling the flow of data to the UI.

By using MVC, we ensure a clean separation of concerns, making the code more maintainable and testable.

## Instructions to Run the App

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/ahmed425/news_app.git
   cd news_app
