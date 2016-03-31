<html>
<body>

<script>

function getLocation(){
if (navigator.geolocation) {
  var timeoutVal = 10 * 1000 * 1000;
  navigator.geolocation.getCurrentPosition(
    displayPosition, 
    displayError,
    { enableHighAccuracy: true, timeout: timeoutVal, maximumAge: 0 }
  );
}
else {
  alert("Geolocation is not supported by this browser");
}

function displayPosition(position) {
  var Latitude=position.coords.latitude
  
  var Longitude=position.coords.longitude
  
  alert("Latitude: " + position.coords.latitude + ", Longitude: " + position.coords.longitude);
}


function displayError(error) {
  var errors = { 
    1: 'Permission denied',
    2: 'Position unavailable',
    3: 'Request timeout'
  };
  alert("Error: " + errors[error.code]);
} 
}

</script>

<%


 %>



</body>


</html>