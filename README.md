# Flutter MVVM REST API Demo

A simple Flutter project built to **learn and practice REST APIs** using the **MVVM (Model-View-ViewModel)** architecture with **Provider** for state management.

This project uses a fake API for authentication and movie listing:
> https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io/movies_list

---

## 🚀 Project Overview

This app was created purely for **learning purposes** — to understand how to:
- Structure a Flutter app using **MVVM architecture**
- Handle **GET** and **POST** requests from REST APIs
- Manage **loading**, **error**, and **complete** states
- Implement **Provider** for state management
- Handle **exceptions and API errors** cleanly

---

## 🧠 What I Learned

- Setting up **MVVM architecture** in Flutter  
- Using **ChangeNotifier** and **Consumer** from Provider  
- Handling API responses with **ApiResponse** class (Status: Loading, Error, Complete)  
- Managing state efficiently using **Provider pattern**  
- Displaying data from REST API in a structured UI  
- Building a clean and reusable **ViewModel** layer  
- Writing modular code for scalability  

---

## 🏗️ Project Architecture


- **data/** → Handles API calls, repositories, and responses  
- **model/** → Defines data models (e.g., MovieListModel)  
- **view_model/** → Contains logic & API integration for UI layers  
- **view/** → UI screens built using Provider and Consumer  
- **utils/** → Utility classes (like Utils, Routes, etc.)  

---

## ⚙️ Technologies Used

- **Flutter**
- **Dart**
- **Provider (State Management)**
- **MVVM Architecture**
- **REST API Integration (GET & POST)**
- **Mock API (Postman Fake API)**


---

## 💡 Future Improvements
- Add search or filter functionality  
- Implement authentication with real API  
- Use Dio or Retrofit for network calls  
- Add caching for offline mode  

---

## 🧑‍💻 Author
**Madhuri Malgaya**

If you like this project, don’t forget to ⭐ it on GitHub!

---


