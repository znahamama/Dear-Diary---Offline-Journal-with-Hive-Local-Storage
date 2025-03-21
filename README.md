# Dear Diary App (Hive Local Storage)

## Overview
The **Dear Diary App** is a lightweight, offline journal that allows users to log their daily experiences, rate their day, and maintain a personal diary. It uses **Hive**, a high-performance **NoSQL database**, to **store entries locally**, ensuring **offline access and fast data retrieval**. The app is built with **Flutter** and follows the **Model-View-Controller (MVC) architecture** for clean, structured code.

## Video Demo
<a href="https://www.youtube.com/shorts/DIgeB33kFfw">
  <img src="https://github.com/user-attachments/assets/0a1f5e08-2600-4054-92fd-62f034684688" 
       alt="Click to play video" width="300" height="600"/>
</a>

---

## Features
 **Offline Storage with Hive** – Entries are **saved locally** and persist even after restarting the app  
 **Lightning-fast Performance** – Hive ensures **quick data access**, optimized for mobile apps  
 **Daily Journal Entries** – Users can log their day with a **140-character** description  
 **Star Rating System** – Users can **rate their day** from **1 to 5 stars**  
 **Reverse Chronological Display** – Recent entries appear **first**, with a **month-year header** when a new month starts  
 **Duplicate Prevention** – Users **cannot enter multiple logs for the same date**  
 **Seamless Navigation** – Switch between the **Diary Log** and **Add Entry** screens smoothly  

---

## How It Works (Hive Local Storage)
The **Dear Diary App** uses **Hive** for **fast, offline storage**. Hive is a **lightweight NoSQL database**, perfect for storing structured data **without requiring an internet connection**.

---

## Project Structure (MVC Architecture)
The app follows a **Model-View-Controller (MVC)** architecture:

📂 lib/
 ├── 📂 model/         # Stores data models using Hive
 │   ├── diary_entry.dart
 │   ├── diary_adapter.dart
 ├── 📂 controller/    # Handles logic, data retrieval, and storage
 │   ├── diary_controller.dart
 ├── 📂 view/          # UI Screens
 │   ├── diary_list_view.dart
 │   ├── add_entry_view.dart
 ├── main.dart         # App entry point

## Installation & Setup
To run this app locally:
1. Clone the repository:
   ```bash
   git clone https://github.com/znahamama/Dear-Diary---Offline-Journal-with-Hive-Local-Storage.git
   cd Dear-Diary---Offline-Journal-with-Hive-Local-Storage
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```
## Tech Stack
- **Flutter** 
- **Hive (NoSQL Local Database)** 
- **MVC Architecture** 
- **Async/Await (Data Handling)** 
