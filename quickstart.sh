#!/bin/bash

# Smart Parking System - Quick Start Script
# This script helps you set up and run the Smart Parking System

echo "=================================="
echo "🅿️  Smart Parking System - Quick Start"
echo "=================================="
echo ""

# Check if Java is installed
echo "✓ Checking Java installation..."
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed. Please install Java 8 or higher."
    echo "📥 Download from: https://www.oracle.com/java/technologies/downloads/"
    exit 1
fi
echo "✅ Java found: $(java -version 2>&1 | head -1)"
echo ""

# Check if MySQL is running
echo "✓ Checking MySQL..."
if mysql -u root -p"${MYSQL_PASSWORD:-root}" -e "SELECT 1" &> /dev/null; then
    echo "✅ MySQL is running and accessible"
else
    echo "⚠️  MySQL is not accessible. Make sure it's running."
    echo "   Command: mysql.server start"
fi
echo ""

# Check if database exists
echo "✓ Checking database..."
if mysql -u root -p"${MYSQL_PASSWORD:-root}" -e "USE parking_system_db; SELECT COUNT(*) FROM locations;" &> /dev/null; then
    echo "✅ Database 'parking_system_db' exists with tables"
else
    echo "❌ Database not found or not properly configured"
    echo "   Please run the SQL setup scripts first"
    echo "   See SETUP_GUIDE.md for detailed instructions"
    exit 1
fi
echo ""

# Check if Tomcat is available
echo "✓ Checking Tomcat..."
TOMCAT_HOME="${CATALINA_HOME:-.}"
if [ -f "$TOMCAT_HOME/bin/startup.sh" ]; then
    echo "✅ Tomcat found at: $TOMCAT_HOME"
else
    echo "⚠️  Tomcat not found in default location"
    echo "   Please set CATALINA_HOME environment variable"
    echo "   Export: CATALINA_HOME=/path/to/tomcat"
fi
echo ""

echo "=================================="
echo "✅ All checks passed!"
echo "=================================="
echo ""
echo "📝 Next Steps:"
echo "1. Open Eclipse IDE"
echo "2. Import the project: File → Import → Existing Projects into Workspace"
echo "3. Right-click project → Run As → Run on Server"
echo "4. Browser will open automatically at:"
echo "   http://localhost:8080/Smart-Parking-System-master/index.html"
echo ""
echo "🎯 Or for manual setup:"
echo "   Run: /path/to/tomcat/bin/startup.sh"
echo ""
echo "📚 For detailed setup instructions, see SETUP_GUIDE.md"
echo ""
echo "=================================="
