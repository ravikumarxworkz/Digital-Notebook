# Digital-Notebook
# Digital Notebook - A Java Web Application
<img src="https://github.com/ravikumarxworkz/Digital-Notebook/blob/main/src/main/webapp/img/Screenshot%20.png" alt="profile Page view">

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Database Schema](#database-schema)
- [Class Structure](#class-structure)
- [Installation](#installation)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Contributing](#contributing)
- [License](#license)

## Overview

Digital Notebook is a web-based note-taking application built using Java EE technologies. It allows users to:
- Create and manage personal accounts
- Write, edit, and organize notes
- Access their notes from anywhere

The application follows MVC architecture and uses JSP for the frontend, Java Servlets for controllers, and MySQL for data persistence.

## Features

- **User Authentication**
  - Registration with email verification
  - Secure login/logout
  - Password encryption

- **Note Management**
  - Create new notes
  - Edit existing notes
  - Delete notes
  - View all notes in a clean interface

- **Responsive Design**
  - Works on desktop and mobile devices
  - Clean, modern UI

## Technologies Used

- **Backend**
  - Java 11
  - J2EE (Servlets, JSP)
  - Apache Tomcat 10.5
  - MySQL 8.0

- **Frontend**
  - HTML5, CSS3
  - Bootstrap 5
  - Font Awesome icons

- **Development Tools**
  - Maven (for dependency management)
  - Git (version control)

## Database Schema

### Users Table
```sql
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    number VARCHAR(15) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Notes Table
```sql
CREATE TABLE post (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    uid INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (uid) REFERENCES user(id) ON DELETE CASCADE
);
```

## Class Structure

### UserDetails Class
```java
public class UserDetails {
    private int id;
    private String firstNameString;
    private String lastNameString;
    private String emailString;
    private String phoneString;
    private String passwordString;
    
    // Getters and setters
    // Constructors
}
```

### Post Class
```java
public class post {
    private int id;
    private String title;
    private String content;
    private Timestamp pDate;
    private UserDetails user;
    
    // Getters and setters
    // Constructors
}
```

## Installation

### Prerequisites
- Java JDK 11 or higher
- Apache Tomcat 10.5
- MySQL 8.0
- Maven

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/ravikumarxworkz/Digital-Notebook.git
   cd Digital-Notebook
   ```

2. **Database Setup**
   - Create a MySQL database named `enotes`
   - Execute the SQL scripts provided in the `database/` folder

3. **Configure Database Connection**
   - Update `src/main/java/Db/DBConnect.java` with your MySQL credentials:
   ```java
   public class DBConnect {
       private static Connection conn;
       public static Connection getConnection() {
           try {
               Class.forName("com.mysql.cj.jdbc.Driver");
               conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "username", "password");
           } catch (Exception e) {
               e.printStackTrace();
           }
           return conn;
       }
   }
   ```

4. **Build and Deploy**
   ```bash
   mvn clean package
   ```
   - Copy the generated WAR file to your Tomcat `webapps` directory

5. **Start Tomcat Server**
   ```bash
   catalina.sh run
   ```

## Usage

After successful installation, access the application at:
```
http://localhost:8080/Enotes/index.jsp
```

### User Flow
1. Register a new account
2. Log in with your credentials
3. Create, view, edit, and delete notes
4. Log out when finished

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/UserServlet` | POST | User registration |
| `/loginServlet` | POST | User login |
| `/AddNotesServlet` | POST | Create new note |
| `/NoteEditServlet` | POST | Update existing note |
| `/deleteServlet` | GET | Delete a note |
| `/showNotes.jsp` | GET | View all notes |

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

