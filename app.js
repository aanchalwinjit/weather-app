const express = require("express");
const nunjucks = require("nunjucks");
const path = require("path");
const weatherRoutes = require("./routes/weatherRoutes");

const app = express();

// Middleware
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(express.static("public"));

// Template Engine
nunjucks.configure("views", {
  autoescape: true,
  express: app,
});

// Routes
app.use("/", weatherRoutes);

// Server
const PORT = 3000;
app.listen(PORT, () => console.log(`Server running at http://localhost:${PORT}`));
