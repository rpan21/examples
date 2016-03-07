/**
 * 
 */
var dataList = document.getElementById('json-datalist');
var input = document.getElementById('labCode');

//Create a new XMLHttpRequest.
var request = new XMLHttpRequest();

// Handle state changes for the request.
request.onreadystatechange = function(response) {
  if (request.readyState === 4) {
    if (request.status === 200) {
      // Parse the JSON
      var jsonOptions = JSON.parse(request.responseText);
      // Loop over the JSON array.
      jsonOptions.forEach(function(item) {
        // Create a new <option> element.
        var option = document.createElement('option');
        // Set the value using the item in the JSON array.
        option.value = item.labCode;
        // Add the <option> element to the <datalist>.
        dataList.appendChild(option);
      });

    }
  }
};
// Set up and make the request.
request.open('GET', "data\\data.json", true);
request.send();