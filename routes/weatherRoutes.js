const express = require("express");
const router = express.Router();
const weatherController = require("../controllers/weatherController");

router.get("/", weatherController.renderHome);
router.get("/getApiKey/:serviceName", weatherController.fetchApiKey);
router.post("/getWeather", weatherController.getWeather);
router.post("/saveWeather", weatherController.saveWeather);
router.get("/getHistory", weatherController.getHistory);

module.exports = router;
