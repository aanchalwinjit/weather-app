# My Node.js Project

## 📁 Project Structure

- `app.js` – Main application file
- `db.js` – Handles database configuration and connection

## ⚙️ Setup

1. **Install dependencies:**
   ```bash
   npm install
2. **Setup DB configuration**
const dbConfig = {
  host: 'localhost',
  user: 'your-username',
  password: 'your-password',
  database: 'your-database'
};

3. **Import Sqls in your DB**
a. weather_db_api_keys.sql
b. weather_db_weather_data.sql
Change app_keys or access_token based on service in api_keys table

🚀 Run the Application
node app.js
