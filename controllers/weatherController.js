const axios = require("axios");
const db = require("../db");

async function getApiKey(serviceName) {
  return new Promise((resolve, reject) => {
    db.query(
      "SELECT api_key FROM api_keys WHERE service_name = ? LIMIT 1",
      [serviceName],
      (err, results) => {
        if (err) return reject(err);
        if (results.length === 0) return reject(new Error("API key not found"));
        resolve(results[0].api_key);
      }
    );
  });
}

exports.renderHome = (req, res) => {
  res.render("index.njk", { weather: null, history: [] });
};

exports.fetchApiKey = async (req, res) => {
  try {
    const apiKey = await getApiKey(req.params.serviceName);
    res.json({ success: true, apiKey });
  } catch (err) {
    res.json({ success: false, error: err.message });
  }
};

exports.getWeather = async (req, res) => {
  const { lat, lon } = req.body;

  if (!lat || !lon) {
    return res.json({ success: false, error: "Latitude and longitude required" });
  }

  try {
    const API_KEY = await getApiKey("openweathermap");

    const { data } = await axios.get(
      `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`
    );
    res.json({ success: true, data });
  } catch (error) {
    res.json({ success: false, error: "Weather data not found" });
  }
};

exports.saveWeather = (req, res) => {
  const { address, response } = req.body;

  const query = "INSERT INTO weather_data (address, response) VALUES (?, ?)";
  db.query(query, [address, JSON.stringify(response)], (err, result) => {
    if (err) return res.json({ success: false, error: err });
    res.json({ success: true });
  });
};

exports.getHistory = (req, res) => {
  db.query("SELECT * FROM weather_data ORDER BY timestamp DESC", (err, results) => {
    if (err) return res.json({ success: false, error: err });

    const history = results.map((row) => ({
      address: row.address,
      data: JSON.parse(row.response),
      time: row.timestamp,
    }));

    res.json({ success: true, history });
  });
};
