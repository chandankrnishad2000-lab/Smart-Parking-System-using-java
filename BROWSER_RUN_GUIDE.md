# How to Run Smart Parking System in Browser

## 🚀 Quick Summary

The Smart Parking System is a **Java Servlet web application** that needs to run on a **Tomcat server** with a **MySQL database**. Here's the complete guide to run it in your browser.

---

## 📋 Prerequisites

Before you start, ensure you have:

1. ✅ **Java 8 or higher** installed
2. ✅ **Apache Tomcat** (v7.0 or higher) installed
3. ✅ **MySQL Server** (v5.x or higher) installed and running
4. ✅ **Eclipse IDE** or any Java IDE (optional but recommended)
5. ✅ Modern web browser (Chrome, Firefox, Safari, or Edge)

---

## 🎯 Method 1: Running with Eclipse IDE (Recommended)

### Step 1: Set Up Database
```bash
# Open MySQL command line
mysql -u root -p

# Create database (copy the SQL from SETUP_GUIDE.md)
# Or use the setup script if you have one
```

### Step 2: Import Project in Eclipse
1. Open **Eclipse IDE**
2. Go to **File** → **Import**
3. Select **General** → **Existing Projects into Workspace**
4. Browse to: `/Users/chandankumar/Downloads/Smart-Parking-System-master`
5. Click **Finish**

### Step 3: Configure Tomcat Server
1. Go to **Window** → **Preferences**
2. Expand **Server** → **Runtime Environments**
3. Click **Add**
4. Select **Apache Tomcat v7.0** → **Next**
5. Click **Browse** and select your Tomcat installation folder
6. Click **Finish** → **Apply and Close**

### Step 4: Run on Server
1. Right-click on the project in Eclipse
2. Select **Run As** → **Run on Server**
3. Select your configured Tomcat server
4. Click **Finish**

✅ **Browser will open automatically at:**
```
http://localhost:8080/Smart-Parking-System-master/
```

---

## 🎯 Method 2: Manual Setup with Tomcat (Alternative)

### Step 1: Build the Project
```bash
# In Eclipse, right-click project
# → Clean Project
# → Build Project
```

### Step 2: Export as WAR File
```bash
# In Eclipse:
# Right-click project → Export → WAR file
# Save as: Smart-Parking-System.war
# Location: Desktop or Downloads folder
```

### Step 3: Deploy to Tomcat
```bash
# Copy WAR file to Tomcat webapps directory
# Mac/Linux:
cp ~/path/to/Smart-Parking-System.war /Applications/tomcat/webapps/

# Windows:
copy C:\path\to\Smart-Parking-System.war C:\path\to\tomcat\webapps\
```

### Step 4: Start Tomcat
```bash
# Mac/Linux:
cd /Applications/tomcat/bin
./startup.sh

# Windows (Command Prompt as Admin):
cd C:\path\to\tomcat\bin
startup.bat
```

### Step 5: Open in Browser
✅ **Navigate to:**
```
http://localhost:8080/Smart-Parking-System/
```

---

## 🛠️ Detailed Setup Steps

### Prerequisites Installation

#### 1. Install Java
```bash
# Download from: https://www.oracle.com/java/technologies/downloads/
# Verify installation:
java -version
```

#### 2. Download Apache Tomcat
```bash
# Download from: https://tomcat.apache.org/download-70.cgi
# Extract to: /Applications/tomcat (Mac) or C:\tomcat (Windows)
```

#### 3. Install MySQL
```bash
# Download from: https://dev.mysql.com/downloads/mysql/
# Follow installer instructions
# Start MySQL:
mysql.server start  # Mac/Linux
# Or use MySQL Workbench
```

#### 4. Download Eclipse IDE
```bash
# Download "Eclipse IDE for Java EE Developers"
# From: https://www.eclipse.org/downloads/
```

### Database Setup

```bash
# Connect to MySQL
mysql -u root -p

# Create database
CREATE DATABASE parking_system_db;
USE parking_system_db;

# Create all tables (copy from SETUP_GUIDE.md or README.md)
```

**Insert sample data:**
```sql
INSERT INTO locations VALUES ('Downtown Parking', 0, 2);
INSERT INTO locations VALUES ('Mall Parking', 1, 2);
INSERT INTO locations VALUES ('Airport Parking', 2, 3);

-- Insert parking lots with details
INSERT INTO parking_lot_info VALUES ('DT Lot 1', 1, 0, 50, 100, 50.0, 20.0);
INSERT INTO parking_lot_info VALUES ('DT Lot 2', 2, 0, 60, 120, 50.0, 20.0);
-- ... add more as shown in SETUP_GUIDE.md
```

---

## 📱 Browser Access URLs

### Main Pages

| Page | URL |
|------|-----|
| **Home** | `http://localhost:8080/Smart-Parking-System-master/index.html` |
| **Sign Up** | `http://localhost:8080/Smart-Parking-System-master/Sign_up_customer.html` |
| **Sign In** | `http://localhost:8080/Smart-Parking-System-master/Sign_in_customer.html` |

### After Deployment (if using WAR export)

| Page | URL |
|------|-----|
| **Home** | `http://localhost:8080/Smart-Parking-System/index.html` |
| **Sign Up** | `http://localhost:8080/Smart-Parking-System/Sign_up_customer.html` |
| **Sign In** | `http://localhost:8080/Smart-Parking-System/Sign_in_customer.html` |

---

## 🧪 Test the Application

### 1. Create Test Account
1. Go to Sign Up page
2. Fill in the form:
   - **Name**: John Doe
   - **Vehicle Number**: DL-01-AB-1234
   - **Vehicle Type**: 1 (Car) or 0 (Bike)
   - **Password**: password123
3. Click **Create Account**
4. **Note the generated Customer ID**

### 2. Login
1. Go to Sign In page
2. Enter:
   - **Customer ID**: (from step 1)
   - **Password**: password123
3. Click **Sign In**

### 3. Browse Parking Locations
1. Click on a location image (Downtown, Mall, or Airport)
2. View parking lots available at that location

### 4. Book a Parking Spot
1. Click on a parking lot image
2. See available spots in green
3. Click on an available spot
4. Choose **"Park Now"** or **"Advanced Booking"**
5. Confirm booking

### 5. Check Your Booking
1. Login again with same credentials
2. Dashboard shows your active booking
3. Click **"Leave Now!"** to exit and see fare

---

## ⚙️ Server Management

### Check Tomcat Status
```bash
# Mac/Linux - Check if running:
lsof -i :8080

# Windows:
netstat -ano | findstr :8080
```

### Stop Tomcat
```bash
# Mac/Linux:
/Applications/tomcat/bin/shutdown.sh

# Windows:
C:\path\to\tomcat\bin\shutdown.bat
```

### View Tomcat Logs
```bash
# Mac/Linux:
tail -f /Applications/tomcat/logs/catalina.out

# Windows:
type C:\path\to\tomcat\logs\catalina.out
```

---

## 🔧 Troubleshooting

### Issue: "Cannot connect to database"
**Solution:**
```bash
# Check MySQL is running
mysql -u root -p -e "SELECT 1;"

# Check database exists
mysql -u root -p -e "USE parking_system_db; SELECT COUNT(*) FROM locations;"

# If password is wrong, update in servlet files
```

### Issue: "Port 8080 already in use"
**Solution:**
```bash
# Find what's using port 8080
lsof -i :8080

# Kill the process
kill -9 <PID>

# Or change Tomcat port in: <TOMCAT_HOME>/conf/server.xml
# Change: <Connector port="8080" to <Connector port="8081"
```

### Issue: "Page shows 404 error"
**Solution:**
1. Verify project is deployed on Tomcat
2. Check URL matches project name
3. Try: `http://localhost:8080/Smart-Parking-System-master/index.html`
4. Or if using WAR: `http://localhost:8080/Smart-Parking-System/index.html`

### Issue: "Blank page after login"
**Solution:**
1. Open browser console (F12) for errors
2. Check MySQL has data: `SELECT * FROM locations;`
3. Review Tomcat logs for exceptions
4. Verify database credentials in servlet files

### Issue: "Compilation errors in Eclipse"
**Solution:**
```bash
# In Eclipse:
# Right-click project → Clean Project
# Right-click project → Build Project
# Check Problems tab for remaining errors
```

---

## 🔐 Security Note

⚠️ **Important**: This is a learning project with known security limitations:

- Passwords are stored as plain text
- No HTTPS/SSL encryption
- No input validation on server side
- Possible SQL injection vulnerabilities

**For production use**, implement:
- Password hashing
- HTTPS/SSL encryption
- Input validation and sanitization
- Proper error handling
- Rate limiting

---

## 📊 Default Test Data

After setup, the system will have:
- **3 Locations**: Downtown Parking, Mall Parking, Airport Parking
- **7 Parking Lots**: With different capacities and pricing
- **Spot Types**: Cars and Bikes with separate pricing

### Pricing Structure (per hour):
- **Downtown**: Cars = ₹50, Bikes = ₹20
- **Mall**: Cars = ₹40, Bikes = ₹15
- **Airport**: Cars = ₹100, Bikes = ₹50

---

## 📞 Getting Help

| Problem | Where to Find Help |
|---------|-------------------|
| Setup issues | `SETUP_GUIDE.md` |
| How system works | `PROJECT_ANALYSIS.md` |
| Feature overview | `README.md` |
| Source code details | Check servlet comments in `src/` |
| Database structure | `SETUP_GUIDE.md` SQL section |

---

## ✅ Verification Checklist

Before accessing in browser, verify:

- [ ] Java installed (`java -version` works)
- [ ] Tomcat downloaded and extracted
- [ ] MySQL running (`mysql -u root -p` connects)
- [ ] Database `parking_system_db` created
- [ ] All tables created in MySQL
- [ ] Sample data inserted
- [ ] Project imported in Eclipse (if using IDE)
- [ ] Project built successfully (0 errors)
- [ ] Tomcat started (or running on server from Eclipse)

---

## 🎉 You're Ready!

Once setup is complete, you can:

1. **Create Account** → Get auto-generated Customer ID
2. **Login** → Browse parking locations
3. **Select Spot** → Choose parking lot and spot
4. **Book** → Immediate or advance booking
5. **Exit** → Calculate fare automatically
6. **Logout** → End session

---

## 📚 Additional Resources

- **Complete Project Analysis**: `PROJECT_ANALYSIS.md` (13 comprehensive sections)
- **Installation Guide**: `SETUP_GUIDE.md` (step-by-step setup)
- **Project Features**: `README.md` (overview and features)
- **Source Code**: `src/` folder (all Java servlets with comments)

---

**Happy Parking! 🅿️**

For any issues or questions, refer to the troubleshooting section or detailed guides mentioned above.

