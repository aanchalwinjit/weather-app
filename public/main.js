let currentWeather = null;

$('#fetchBtn').click(() => {
  const address = $('#address').val().trim();
  if (!address) return alert("Please enter an address");

  // First get Mapbox API key from server
  $.get('/getApiKey/mapbox').done((res) => {
    if (!res.success) return alert("Failed to get Mapbox API key");

    const MAPBOX_API_KEY = res.apiKey;

    // Geocode address
    $.get(`https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(address)}.json`, {
      access_token: MAPBOX_API_KEY,
      limit: 1
    }).done((geoData) => {
      if (!geoData.features || geoData.features.length === 0) {
        return alert("Address not found");
      }

      const [lon, lat] = geoData.features[0].center;

      // Call your backend to get weather using lat/lon
      $.post('/getWeather', { lat, lon }, res => {
        if (res.success) {
          const data = res.data;
          currentWeather = data;
          const weatherIcon = data.weather[0].icon;
          const temp = data.main.temp;
          const feelsLike = data.main.feels_like;
          const humidity = data.main.humidity;
          const wind = data.wind.speed;
          const pressure = data.main.pressure;
          const description = data.weather[0].description;
          const cityName = data.name;
          const sunrise = new Date(data.sys.sunrise * 1000).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
          const sunset = new Date(data.sys.sunset * 1000).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

          $('#weatherResult').html(`
            <div class="weather-card text-white p-4 rounded">
              <div class="row align-items-center">
                <div class="col-md-4 text-center">
                  <div class="display-3 font-weight-bold">${temp}°C</div>
                  <div class="text-muted">Feels like: ${feelsLike}°C</div>
                  <img src="https://openweathermap.org/img/wn/${weatherIcon}@4x.png" alt="Weather Icon" style="width: 80px;">
                  <div class="h5 mt-2">${description.charAt(0).toUpperCase() + description.slice(1)}</div>
                </div>

                <div class="col-md-8">
                  <div class="row text-center">
                    <div class="col-6 col-sm-4 mb-3">
                      <i class="fas fa-tint fa-lg"></i><br>
                      <small>Humidity</small><br>
                      <strong>${humidity}%</strong>
                    </div>
                    <div class="col-6 col-sm-4 mb-3">
                      <i class="fas fa-wind fa-lg"></i><br>
                      <small>Wind</small><br>
                      <strong>${wind} m/s</strong>
                    </div>
                    <div class="col-6 col-sm-4 mb-3">
                      <i class="fas fa-tachometer-alt fa-lg"></i><br>
                      <small>Pressure</small><br>
                      <strong>${pressure} hPa</strong>
                    </div>
                    <div class="col-6 col-sm-4 mb-3">
                      <i class="fas fa-sun fa-lg text-warning"></i><br>
                      <small>Sunrise</small><br>
                      <strong>${sunrise}</strong>
                    </div>
                    <div class="col-6 col-sm-4 mb-3">
                      <i class="fas fa-moon fa-lg text-light"></i><br>
                      <small>Sunset</small><br>
                      <strong>${sunset}</strong>
                    </div>
                    <div class="col-6 col-sm-4 mb-3">
                      <i class="fas fa-map-marker-alt fa-lg text-danger"></i><br>
                      <small>Location</small><br>
                      <strong>${cityName}</strong>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          `);
        } else {
          alert(res.error);
        }
      });
    }).fail(() => alert("Failed to geocode the address"));
  }).fail(() => alert("Failed to fetch Mapbox API key"));
});

$('#saveBtn').click(() => {
  const address = $('#address').val().trim();
  if (!address) return alert("Please enter an address");
  if (!currentWeather) return alert("Please fetch weather first");

  $.post('/saveWeather', { 
    address: address, 
    response: currentWeather 
  }, res => {
    if (res.success) {
      alert("Weather saved successfully");
    } else {
      alert("Failed to save weather: " + res.error);
    }
  });
});

$('#historyBtn').click(() => {
  $.get('/getHistory', res => {
    if (res.success) {
      let html = `<div class="row">`;

      res.history.forEach(entry => {
        const { temp, humidity, feels_like, pressure } = entry.data.main;
        const wind = entry.data.wind.speed;
        const { description, icon } = entry.data.weather[0];
        const { sunrise, sunset } = entry.data.sys;
        const address = entry.address;
        const dateTime = new Date(entry.time).toLocaleString();

        const sunriseTime = new Date(sunrise * 1000).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        const sunsetTime = new Date(sunset * 1000).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

        html += `
          <div class="col-md-6 col-lg-4 mb-4">
            <div class="custom-weather-card shadow-sm p-3 rounded">
              <div class="d-flex justify-content-between align-items-start">
                <div>
                  <h6 class="mb-1 text-primary"><i class="fas fa-map-marker-alt text-danger"></i> ${address}</h6>
                  <small class="text-muted"><i class="far fa-clock"></i> ${dateTime}</small>
                </div>
                <img src="https://openweathermap.org/img/wn/${icon}@2x.png" alt="${description}" width="50">
              </div>

              <hr>

              <div class="row text-center">
                <div class="col-6">
                  <i class="fas fa-temperature-high text-warning"></i>
                  <div class="small text-muted">Temp</div>
                  <strong>${temp}°C</strong>
                </div>
                <div class="col-6">
                  <i class="fas fa-thermometer-half text-info"></i>
                  <div class="small text-muted">Feels Like</div>
                  <strong>${feels_like}°C</strong>
                </div>
              </div>

              <div class="row text-center mt-3">
                <div class="col-6">
                  <i class="fas fa-tint text-primary"></i>
                  <div class="small text-muted">Humidity</div>
                  <strong>${humidity}%</strong>
                </div>
                <div class="col-6">
                  <i class="fas fa-wind text-secondary"></i>
                  <div class="small text-muted">Wind</div>
                  <strong>${wind} m/s</strong>
                </div>
              </div>

              <div class="row text-center mt-3">
                <div class="col-6">
                  <i class="fas fa-sun text-warning"></i>
                  <div class="small text-muted">Sunrise</div>
                  <strong>${sunriseTime}</strong>
                </div>
                <div class="col-6">
                  <i class="fas fa-moon text-purple"></i>
                  <div class="small text-muted">Sunset</div>
                  <strong>${sunsetTime}</strong>
                </div>
              </div>
            </div>
          </div>
        `;
      });

      html += `</div>`;
      $('#history').html(html);
    }
  });
});
let elementCount = 0;

$('#addElementBtn').click(() => {
  elementCount++;

  const newElement = $(`
    <div class="card p-3 mb-3 shadow-sm dynamic-box">
      <h6>Dynamic Element ${elementCount}</h6>
      <p class="text-muted mb-2">Climate is what we expect, weather is what we get.</p>
      <button class="btn btn-danger btn-sm removeBtn">Remove</button>
    </div>
  `);

  $('#dynamicContainer').append(newElement);
});

// Delegate remove event to handle dynamically created buttons
$('#dynamicContainer').on('click', '.removeBtn', function () {
  $(this).closest('.dynamic-box').remove();
});