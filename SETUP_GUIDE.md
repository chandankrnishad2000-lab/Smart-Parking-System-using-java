# Smart Parking System - Complete Setup Guide

## 🎯 Quick Start (5 Minutes)

### Prerequisites Check
```bash
# Check Java installation
java -version

# Should show: Java version 8 or higher
```

---

## 📋 Step-by-Step Setup Instructions

### STEP 1: Download & Install Required Software

#### 1.1 Java Development Kit (JDK)
- **Download**: https://www.oracle.com/java/technologies/downloads/
- **Install**: Follow the official installer
- **Verify**:
  ```bash
  java -version
  javac -version
  ```

#### 1.2 Apache Tomcat
- **Download**: https://tomcat.apache.org/download-70.cgi
- **Extract**: Unzip to a location (e.g., `/Applications/tomcat` on Mac)
- **Remember**: This path is needed for Eclipse configuration

#### 1.3 MySQL Server
- **Download**: https://dev.mysql.com/downloads/mysql/
- **Install**: Follow the official installer
- **Start MySQL** (if not running):
  ```bash
  # Mac/Linux
  mysql.server start
  
  # Windows
  net start MySQL80
  ```

#### 1.4 IDE (Recommended: Eclipse)
- **Download**: https://www.eclipse.org/downloads/packages/
- **Select**: "Eclipse IDE for Java EE Developers"
- **Install**: Follow the official installer

---

### STEP 2: Set Up Database

#### 2.1 Connect to MySQL
```bash
# Open MySQL command line
mysql -u root -p
# Enter your MySQL password when prompted
```

#### 2.2 Create Database
```sql
-- Copy and paste these commands in MySQL

-- Create the main database
CREATE DATABASE parking_system_db;
USE parking_system_db;

-- Create customer information table
CREATE TABLE customer_info (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL,
    vehicle_number VARCHAR(20) NOT NULL,
    vehicle_type INT NOT NULL,
    password VARCHAR(50) NOT NULL
);

-- Create locations table
CREATE TABLE locations (
    location_name VARCHAR(100),
    code INT PRIMARY KEY,
    number_of_parking_lots INT
);

-- Create parking lot information table
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

-- Create parking spot information table
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

#### 2.3 Insert Sample Data
```sql
-- Insert locations
INSERT INTO locations VALUES ('Downtown Parking', 0, 2);
INSERT INTO locations VALUES ('Mall Parking', 1, 2);
INSERT INTO locations VALUES ('Airport Parking', 2, 3);

-- Insert parking lots
INSERT INTO parking_lot_info VALUES ('DT Lot 1', 1, 0, 50, 100, 50.0, 20.0);
INSERT INTO parking_lot_info VALUES ('DT Lot 2', 2, 0, 60, 120, 50.0, 20.0);
INSERT INTO parking_lot_info VALUES ('Mall Lot 1', 3, 1, 80, 150, 40.0, 15.0);
INSERT INTO parking_lot_info VALUES ('Mall Lot 2', 4, 1, 100, 200, 40.0, 15.0);
INSERT INTO parking_lot_info VALUES ('Airport Lot 1', 5, 2, 200, 300, 100.0, 50.0);
INSERT INTO parking_lot_info VALUES ('Airport Lot 2', 6, 2, 150, 250, 100.0, 50.0);
INSERT INTO parking_lot_info VALUES ('Airport Lot 3', 7, 2, 180, 280, 100.0, 50.0);

-- Verify data was inserted
SELECT * FROM locations;
SELECT * FROM parking_lot_info;
```

---

### STEP 3: Configure Eclipse IDE

#### 3.1 Open Eclipse
- Launch Eclipse IDE
- Select a workspace location

#### 3.2 Import the Project
1. Go to **File** → **Import**
2. Select **General** → **Existing Projects into Workspace**
3. Click **Next**
4. Click **Browse**
5. Navigate to `/Users/chandankumar/Downloads/Smart-Parking-System-master`
6. Select the folder and click **Open**
7. Click **Finish**

#### 3.3 Configure Tomcat in Eclipse
1. Go to **Eclipse** → **Preferences** (Mac) or **Window** → **Preferences** (Windows)
2. Expand **Server** → **Runtime Environments**
3. Click **Add**
4. Select **Apache Tomcat v7.0** and click **Next**
5. Click **Browse** and select your Tomcat installation directory
6. Click **Finish** → **Apply and Close**

#### 3.4 Add Project to Server
1. Right-click on the project
2. Select **Properties**
3. Look for **Project Facets**
4. Click **Convert to faceted form**
5. Check **Dynamic Web Module**
6. Under **Runtimes** tab, select your configured Tomcat server
7. Click **Apply** → **OK**

---

### STEP 4: Update Database Credentials

#### 4.1 Edit Servlet Files (if needed)
Each Java Servlet file contains database connection details. These should match your MySQL setup:

```java
// In each servlet file, find these lines:
String url="jdbc:mysql://localhost:3306/";
String dbname="parking_system_db";
String uname="root";              // Your MySQL username
String pwd="root";                // Your MySQL password
String driver="com.mysql.jdbc.Driver";
```

**If your MySQL credentials are different**, update these values in:
- `src/Sign_in_Customer.java`
- `src/Sign_up_cust_servlet.java`
- `src/Locations_spot_info.java`
- `src/Parking_spot_info.java`
- `src/Select_spot_car.java`
- `src/Select_spot_bike.java`
- `src/Final_Car_Book.java`
- `src/Final_Bike_Book.java`
- `src/Leave_Customer.java`

---

### STEP 5: Build the Project

#### 5.1 Clean and Build
1. In Eclipse, right-click on the project
2. Select **Clean Project**
3. Wait for build to complete
4. Check **Console** tab - should say "Build Successful" with no errors

#### 5.2 Verify No Errors
- Look at the **Problems** tab
- Should show 0 errors
- Some warnings are OK

---

### STEP 6: Run on Tomcat Server

#### 6.1 Using Eclipse (Recommended)
1. Right-click on the project
2. Select **Run As** → **Run on Server**
3. Select your configured Tomcat server
4. Click **Next** → **Finish**
5. Browser will automatically open with the application

#### 6.2 Manual Method (If Eclipse method fails)
1. **Build and Export**:
   - Right-click project → **Export** → **WAR file**
   - Save as `Smart-Parking-System.war`
   - Keep the default settings

2. **Copy to Tomcat**:
   ```bash
   # Mac/Linux
   cp ~/path/to/Smart-Parking-System.war /Applications/tomcat/webapps/
   
   # Windows
   copy C:\path\to\Smart-Parking-System.war C:\path\to\tomcat\webapps\
   ```

3. **Start Tomcat**:
   ```bash
   # Mac/Linux
   cd /Applications/tomcat/bin
   ./startup.sh
   
   # Windows
   cd C:\path\to\tomcat\bin
   startup.bat
   ```

4. **Open in Browser**:
   - Navigate to: `http://localhost:8080/Smart-Parking-System/`

---

## 🌐 Access the Application

### URLs for Different Pages

| Page | URL |
|------|-----|
| **Home** | `http://localhost:8080/Smart-Parking-System-master/index.html` |
| **Sign In** | `http://localhost:8080/Smart-Parking-System-master/Sign_in_customer.html` |
| **Sign Up** | `http://localhost:8080/Smart-Parking-System-master/Sign_up_customer.html` |

---

## 🧪 Test the Application

### Test User Workflow

#### 1. Create a Test Account
1. Go to Sign Up page
2. Enter:
   - **Name**: John Doe
   - **Vehicle Number**: DL-01-AB-1234
   - **Vehicle Type**: 1 (for Car) or 0 (for Bike)
   - **Password**: test123456
3. Click **Create Account**
4. Note the generated **Customer ID**

#### 2. Login with Test Account
1. Go to Sign In page
2. Enter:
   - **Customer ID**: (from previous step)
   - **Password**: test123456
3. Click **Sign In**
4. You should see your profile and available parking locations

#### 3. Book a Parking Spot
1. Click on a parking location
2. Select a parking lot
3. View available spots (green = available)
4. Click on an available spot
5. Choose **"Park Now"** for immediate booking
6. Confirm booking

#### 4. Check Booking
1. Login again with the same account
2. You should see your active booking
3. Click **"Leave now!"** to calculate fare
4. Fare is calculated as: (Duration Hours × Hourly Rate)

---

## 🛠️ Troubleshooting

### Issue 1: "Cannot connect to database"
**Solution**:
```bash
# Check if MySQL is running
mysql -u root -p -e "SELECT 1;"

# If not running, start it
mysql.server start  # Mac/Linux

# Verify database exists
mysql -u root -p -e "SHOW DATABASES;"

# Verify user can connect
mysql -u root -p parking_system_db -e "SELECT * FROM locations;"
```

### Issue 2: "Port 8080 already in use"
**Solution**:
```bash
# Find process using port 8080
lsof -i :8080

# Kill the process
kill -9 <PID>

# Or change Tomcat port in:
# <TOMCAT_HOME>/conf/server.xml
# Look for: <Connector port="8080"
# Change to: <Connector port="8081"
```

### Issue 3: "Compilation errors in Eclipse"
**Solution**:
1. Right-click project → **Clean Project**
2. Right-click project → **Build Project**
3. If still failing:
   - Right-click project → **Properties**
   - **Java Build Path** → **Libraries** tab
   - Make sure JRE System Library is selected
   - Click **Apply** → **OK**

### Issue 4: "Blank page after login"
**Solution**:
1. Check browser console (F12) for JavaScript errors
2. Verify MySQL has data:
   ```sql
   SELECT COUNT(*) FROM locations;
   SELECT COUNT(*) FROM parking_lot_info;
   ```
3. Check Tomcat logs: `<TOMCAT_HOME>/logs/catalina.out`

### Issue 5: "404 - Page Not Found"
**Solution**:
- Ensure project is deployed: Right-click → **Run As** → **Run on Server**
- Verify URL is correct: Should include project name in path
- Restart Tomcat and try again

---

## 📊 Database Verification

### Check Database Setup
```sql
-- Run these commands to verify setup

-- Check database exists
SHOW DATABASES;

-- Connect to database
USE parking_system_db;

-- Check all tables exist
SHOW TABLES;

-- Verify locations data
SELECT * FROM locations;

-- Verify parking lots data
SELECT * FROM parking_lot_info;

-- Count available parking spots
SELECT COUNT(*) AS total_car_spots FROM parking_lot_info;
```

---

## 🔍 Server Logs

### View Tomcat Logs
```bash
# Mac/Linux
tail -f /Applications/tomcat/logs/catalina.out

# Windows
type C:\path\to\tomcat\logs\catalina.out
```

### View Eclipse Console
- In Eclipse, go to **Window** → **Show View** → **Console**
- Logs appear in real-time as you use the application

---

## ✅ Verification Checklist

Before considering setup complete, verify:

- [ ] Java installed (`java -version` works)
- [ ] Tomcat downloaded and extracted
- [ ] MySQL running and accessible
- [ ] Database `parking_system_db` created
- [ ] All tables created in MySQL
- [ ] Sample data inserted (at least 7 parking lots)
- [ ] Eclipse IDE installed
- [ ] Project imported in Eclipse
- [ ] Tomcat configured as Server Runtime
- [ ] Project built with 0 errors
- [ ] Project runs on server without errors
- [ ] Browser shows index.html successfully
- [ ] Can navigate to Sign In and Sign Up pages

---

## 🚀 Running the Application

### Final Steps to Start Using

1. **Ensure MySQL is running**:
   ```bash
   mysql.server status
   ```

2. **Start Tomcat** (if using manual method):
   ```bash
   /Applications/tomcat/bin/startup.sh
   ```

3. **In Eclipse, right-click project** → **Run As** → **Run on Server**

4. **Open Browser**:
   ```
   http://localhost:8080/Smart-Parking-System-master/index.html
   ```

5. **Create Account** → **Login** → **Book Parking** → **Done!**

---

## 📞 Getting Help

| Issue Type | Solution |
|-----------|----------|
| Java/Compilation errors | Check Java version, rebuild project |
| Database connection | Verify MySQL running, check credentials |
| Tomcat issues | Check port availability, review logs |
| Page not loading | Verify project deployed, check URL |
| Data not showing | Verify database has sample data |

---

## 🎓 Learn More

- **Project Analysis**: Read `PROJECT_ANALYSIS.md` for technical details
- **README**: See `README.md` for feature overview
- **Servlet Classes**: Check source code comments in `src/` folder
- **Database**: Review SQL setup in `SETUP_GUIDE.md` (this file)

---

**Congratulations! Your Smart Parking System is now ready to use!** 🎉

If you encounter any issues, refer to the Troubleshooting section or check the detailed Project Analysis document.

