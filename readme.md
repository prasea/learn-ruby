# Expense Tracker

## Overview

The Expense Tracker CLI Application is designed to assist a single user in managing their expenses efficiently. It provides basic CRUD (Create, Read, Update, Delete) functionality to add, view, edit, and delete expense records via a command-line interface. This project aims to provide a user-friendly experience for tracking expenses.

## Algorithm

1. **Initialization:**

   - Load necessary libraries and dependencies.
   - Establish a connection to the database.

2. **Menu Display:**

   - Display the main menu with options for Create, Read, Update, Delete, or Exit.

3. **Option Selection:**

   - Prompt the user to select an option from the menu.
   - Based on the user's selection, execute the corresponding functionality.

4. **Create:**

   - Prompt the user to enter details for the new expense record (date, category, amount, description).
   - Validate the input data.
   - Insert the new expense record into the database.

5. **Read:**

   - Display options to view all expenses or filter them based on categories or date ranges.
   - Retrieve expense records from the database based on the user's selection.
   - Display the retrieved expense records to the user.

6. **Update:**

   - Prompt the user to select an expense record to update.
   - Display the current details of the selected expense record.
   - Allow the user to modify specific fields (date, category, amount, description).
   - Update the expense record in the database with the new information.

7. **Delete:**

   - Prompt the user to select an expense record to delete.
   - Confirm the deletion with the user.
   - Remove the selected expense record from the database.

8. **Exit:**
   - Terminate the application and close the database connection.

## Scope

The project scope defines the boundaries and deliverables of the Expense Tracker CLI Application. It outlines what functionalities and features will be included within the defined timeframe and resources. Here's a detailed breakdown of the project scope:

- Develop a CLI application for expense tracking.
- Implement CRUD functionality for managing expense records.
- Validate user input for data integrity.
- Use a database for data storage and persistence.
- Design an intuitive command-line interface.
- Ensure basic filtering options for viewing expenses.
- Test the application thoroughly for reliability.
- Exclude advanced features like user authentication in the initial version.

### CRUD functionality in Expense Tracker

**Create:** Users can add new expense records, including details such as date, item_name, and amount.
**Read:** Users can view a list of all expense records or filter them based on item_name or date ranges.
**Update:** Users can modify existing expense records, including updating date, item_name, or amount.
**Delete:** Users can delete specific expense records from the system.

## Features

**Data persistence:** Store expense records in a database to ensure data is retained even after terminal ends.
**Data validation:** Validate user input to ensure the integrity and accuracy of expense records.
**Search functionality:** Allow users to search for specific expense records using item_name.
**Reporting:** Generate reports summarizing expenses over specified time periods or by item_name.

## Milestones

1. **Project Setup:**

   - Set up the development environment.
   - Define project scope and features

2. **CLI Interface Development:**

   - Develop a basic command-line interface for user interaction.

3. **CRUD Functionality:**

   - Implement basic CRUD operations (Create, Read, Update, Delete) for managing expense records.

4. **Testing:**

   - Conduct testing to ensure CRUD functionality works as expected.

5. **Review and Refinement:**
   - Review the application for usability and functionality.
   - Make necessary refinements based on feedback.
