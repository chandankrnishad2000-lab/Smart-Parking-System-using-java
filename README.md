# Smart Parking System 🚗

An automated **Java Servlet-based** parking management portal designed to revolutionize urban parking. This comprehensive application handles real-time spot availability, online booking, and automated fare calculation across multiple parking locations.

**Developed as Part of**: Java & Database Management System Course  
**Version**: 2.0 (Enhanced)  
**Status**: ✅ Fully Functional MVP

---

## 🎯 Overview

Smart Parking System eliminates parking hassles by providing:
- Real-time parking spot availability tracking
- Instant online parking reservations
- Advance booking capability for planned visits
- Automated, transparent fare calculation
- Multi-location and multi-vehicle type support

---

## 🛠️ Technologies Used

| Layer | Technology |
|-------|-----------|
| **Frontend** | HTML5, CSS3, JavaScript, Bootstrap 3.3.5 |
| **Backend** | Java Servlets, JDBC |
| **Database** | MySQL 5.x |
| **Server** | Apache Tomcat 7.0+ |
| **Validation** | Client-side JavaScript, Server-side Java |
| **Version Control** | Git & GitHub |

---

## ✨ Key Features

### 👤 User Management
- **Easy Registration**: Self-registration with auto-generated Customer ID
- **Secure Login**: Credential-based authentication with session management
- **Vehicle Registration**: Support for both cars and bikes with different pricing

### 🅿️ Parking Operations
- **Real-Time Availability**: Color-coded spot status (Green=Available, Orange=Booked, Red=Parked)
- **Instant Booking**: Book available spots immediately with current timestamp
- **Future Booking**: Schedule parking for specific future dates and times
- **Multi-Location Support**: Browse and book across multiple parking locations

### 💰 Fare Management
- **Automatic Calculation**: Transparent fare based on duration and vehicle type
- **Location-Based Pricing**: Different rates for different parking lots
- **Vehicle-Type Differentiation**: Separate pricing for cars vs bikes
- **Real-Time Display**: See fare amount before leaving

### 🎮 User Experience
- **Intuitive Interface**: Easy navigation through parking lots and spots
- **Visual Feedback**: Animated UI elements and real-time status updates
- **Responsive Design**: Works seamlessly on desktop and mobile browsers

---

## 📋 Prerequisites

Before running this project, ensure you have installed:

1. **Java Development Kit (JDK)** 8 or higher
   ```bash
   java -version
   ```

2. **Apache Tomcat** 7.0 or higher
   - Download from: https://tomcat.apache.org/download-70.cgi

3. **MySQL Server** 5.x or higher
   - Download from: https://dev.mysql.com/downloads/mysql/

4. **MySQL JDBC Driver** (mysql-connector-java)
   - Already included in the project

5. **IDE** (Optional but recommended)
   - Eclipse IDE for Java Developers
   - Or any other Java IDE

---

## 🚀 Installation & Setup

### Step 1: Set Up the Database

1. Open MySQL Command Line or MySQL Workbench
2. Create the database:
```sql
CREATE DATABASE parking_system_db;
USE parking_system_db;
```

3. Create the required tables:

```sql
-- Customer Information Table
CREATE TABLE customer_info (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL,
    vehicle_number VARCHAR(20) NOT NULL,
    vehicle_type INT NOT NULL,
    password VARCHAR(50) NOT NULL
);

-- Locations Table
CREATE TABLE locations (
    location_name VARCHAR(100),
    code INT PRIMARY KEY,
    number_of_parking_lots INT
);

-- Parking Lot Information Table
CREATE TABLE parking_lot_info (
    parking_lot_name VARCHAR(100),
    park_number INT PRIMARY KEY,
    location_code INT,
    number_of_car_spots INT,
    number_of_bike_spots INT,
    cost_of_car_parkings FLOAT,
    cost_of_bike_parkings FLOAT,
    FOREIGN KEY (location_code) REFERENCES locations(code)
);

-- Parking Spot Information Table
CREATE TABLE parking_spot_info (
    spot_number INT,
    park_num INT,
    vehicle_type INT,
    customer_id INT,
    booking_date DATE,
    booking_time TIME,
    status INT,
    FOREIGN KEY (park_num) REFERENCES parking_lot_info(park_number),
    FOREIGN KEY (customer_id) REFERENCES customer_info(customer_id)
);
```

4. Insert sample data:
```sql
-- Insert Locations
INSERT INTO locations VALUES ('Downtown Parking', 0, 2);
INSERT INTO locations VALUES ('Mall Parking', 1, 2);
INSERT INTO locations VALUES ('Airport Parking', 2, 3);

-- Insert Parking Lots
INSERT INTO parking_lot_info VALUES ('DT Lot 1', 1, 0, 50, 100, 50.0, 20.0);
INSERT INTO parking_lot_info VALUES ('DT Lot 2', 2, 0, 60, 120, 50.0, 20.0);
INSERT INTO parking_lot_info VALUES ('Mall Lot 1', 3, 1, 80, 150, 40.0, 15.0);
INSERT INTO parking_lot_info VALUES ('Mall Lot 2', 4, 1, 100, 200, 40.0, 15.0);
INSERT INTO parking_lot_info VALUES ('Airport Lot 1', 5, 2, 200, 300, 100.0, 50.0);
INSERT INTO parking_lot_info VALUES ('Airport Lot 2', 6, 2, 150, 250, 100.0, 50.0);
INSERT INTO parking_lot_info VALUES ('Airport Lot 3', 7, 2, 180, 280, 100.0, 50.0);
```

### Step 2: Configure the Project in Eclipse

1. Open Eclipse IDE
2. Go to **File → Import → General → Existing Projects into Workspace**
3. Browse and select the `Smart-Parking-System-master` folder
4. Click **Finish**

### Step 3: Configure Tomcat Server

1. In Eclipse, go to **Window → Show View → Servers**
2. Right-click in the Servers view → **New → Server**
3. Select **Apache Tomcat v7.0** (or your version)
4. Click **Next** and browse to your Tomcat installation directory
5. Add the Smart Parking System project to the server
6. Click **Finish**

### Step 4: Update Database Configuration

The database configuration is located in the Java Servlet files. Update the connection parameters:

In each servlet file, modify:
```java
String url="jdbc:mysql://localhost:3306/";
String dbname="parking_system_db";
String uname="root";              // Your MySQL username
String pwd="root";                // Your MySQL password
String driver="com.mysql.jdbc.Driver";
```

### Step 5: Build the Project

1. Right-click on the project → **Build Project**
2. Ensure no compilation errors exist

---

## ▶️ Running the Application

### Option 1: Using Eclipse IDE

1. Right-click on the project → **Run As → Run on Server**
2. Select the configured Tomcat server
3. Click **Finish**
4. The application will automatically open in your default browser at: `http://localhost:8080/Smart-Parking-System-master/`

### Option 2: Using Tomcat Directly

1. Copy the project folder to: `<TOMCAT_HOME>/webapps/`
2. Start Tomcat:
   ```bash
   cd <TOMCAT_HOME>/bin
   ./startup.sh        # On Mac/Linux
   startup.bat         # On Windows
   ```
3. Open browser and navigate to: `http://localhost:8080/Smart-Parking-System-master/index.html`

---

## 📱 How to Use

### For New Users:

1. **Open the Application**: Navigate to `http://localhost:8080/Smart-Parking-System-master/index.html`

2. **Register an Account**:
   - Click "Sign Up" or go to `Sign_up_customer.html`
   - Enter your name, vehicle number, vehicle type (0=Bike, 1=Car), and password
   - Your unique Customer ID will be generated automatically

3. **Login**:
   - Use your Customer ID and password to log in
   - You'll see your vehicle information and available parking locations

4. **Browse Parking Locations**:
   - Click on a parking location image
   - View all parking lots in that location with pricing details

5. **Select Parking Lot**:
   - Click on the parking lot image
   - View real-time availability of parking spots

6. **Book a Spot**:
   - **Immediate Parking**: Click "Park Now" → Select an available spot → Confirm
   - **Advance Booking**: Click "Advanced Booking" → Select date & time → Select spot → Confirm

7. **Exit Parking**:
   - After parking, log in again
   - Click "Leave now!" to see calculated fare
   - Fare is calculated as: `(Duration in Hours) × (Hourly Rate)`

8. **Logout**:
   - Click "Logout" to end your session

---

## 🗂️ Project Structure

```
Smart-Parking-System-master/
│
├── src/                           # Java Servlet Source Code
│   ├── Sign_up_cust_servlet.java        # User registration
│   ├── Sign_in_Customer.java            # User login
│   ├── Locations_spot_info.java         # Location browsing
│   ├── Parking_spot_info.java           # Spot display
│   ├── Select_spot_car.java             # Car spot selection
│   ├── Select_spot_bike.java            # Bike spot selection
│   ├── Final_Car_Book.java              # Car booking
│   ├── Final_Bike_Book.java             # Bike booking
│   ├── Leave_Customer.java              # Exit & fare calculation
│   └── LogoutServlet.java               # Logout handler
│
├── WebContent/                    # Frontend Files
│   ├── index.html                 # Home page
│   ├── Sign_in_customer.html      # Login page
│   ├── Sign_up_customer.html      # Registration page
│   ├── css/                       # Stylesheets
│   │   ├── bootstrap.css
│   │   ├── bootstrap.min.css
│   │   ├── style3.css
│   │   └── animate.css
│   ├── js/                        # JavaScript libraries
│   │   ├── jquery.min.js
│   │   ├── bootstrap.min.js
│   │   ├── wow.min.js
│   │   └── ...
│   └── images/                    # Assets
│
├── build/                         # Compiled classes
├── .settings/                     # Eclipse configuration
├── README.md                      # This file
├── PROJECT_ANALYSIS.md            # Detailed project documentation
└── .classpath & .project          # Eclipse project files

```

---

## 🔐 Important Security Notes

⚠️ **This is a learning project and has known security limitations:**

- Passwords are stored in plain text (should be hashed in production)
- No SSL/HTTPS encryption (add for production)
- SQL injection vulnerabilities exist (use only PreparedStatements in production)
- No input validation on server-side (validate all inputs in production)

**For Production Use**, implement:
- Password hashing (bcrypt, Argon2)
- SSL/HTTPS encryption
- Input sanitization and validation
- SQL prepared statements everywhere
- Rate limiting and authentication tokens

---

## 🐛 Troubleshooting

| Issue | Solution |
|-------|----------|
| **Database connection failed** | Check MySQL is running, verify credentials in servlets, ensure database name is correct |
| **Port 8080 already in use** | Change Tomcat port in `server.xml` or kill process using port 8080 |
| **Compilation errors** | Ensure JDK is properly installed, rebuild project, check library paths |
| **Blank page after login** | Check browser console for errors, verify database has data |
| **Can't find servlets** | Ensure project is deployed on Tomcat, check URL mapping in @WebServlet annotations |

---

## 📈 Future Enhancements

- [ ] Payment gateway integration (Stripe, PayPal)
- [ ] Mobile application (iOS/Android)
- [ ] Email notifications for bookings
- [ ] Admin dashboard for operators
- [ ] Real-time notifications (SMS/Push)
- [ ] Advanced analytics and reporting
- [ ] IoT sensor integration
- [ ] Machine learning demand prediction
- [ ] QR code spot verification

---

## 📚 Additional Documentation

- **Comprehensive Project Analysis**: See `PROJECT_ANALYSIS.md` for detailed technical documentation
- **API Endpoints**: See servlet classes for URL patterns and parameters
- **Database Schema**: See SQL setup section above

---

## 👨‍💻 Authors & Contributors

- **Developer**: Chandan Kumar
- **Course**: Java & DBMS
- **Platform**: GitHub

---

## 📄 License

This project is provided as-is for educational purposes.

---

## 📞 Support

For issues or questions:
1. Check the `PROJECT_ANALYSIS.md` documentation
2. Review the troubleshooting section above
3. Check servlet class comments for specific operations
4. Review database structure for data format

---

## ✅ Checklist Before Running

- [ ] MySQL server installed and running
- [ ] Apache Tomcat downloaded and configured
- [ ] Java JDK 8+ installed
- [ ] Database `parking_system_db` created
- [ ] Database tables created and sample data inserted
- [ ] Project imported in Eclipse
- [ ] Tomcat server configured in Eclipse
- [ ] Database credentials updated in servlet files
- [ ] Project built successfully (no errors)
- [ ] Tomcat started

---

**Ready to go! Navigate to `http://localhost:8080/Smart-Parking-System-master/index.html` to start using the Smart Parking System!** 🎉
