var http_request = function(url, callback) {
    var Http = new XMLHttpRequest();
    Http.open("GET", url, true);
    Http.send();

    Http.onreadystatechange = (e) => {
        if (Http.readyState == 4) {
            data = JSON.parse(Http.response)
            callback(data);
        }
    }
}
