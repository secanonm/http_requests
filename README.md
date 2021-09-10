<center>#HTTP Requests</center>
<center>HTTP Requests Package Inspired By Python Requests Module Which Is Used For To Make HTTP Request And Get Response You Can Use It In Rest API</center>

## Install

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  http_requests: ^0.0.1
```

## Usage
Start by importing the library
```dart
import 'package:http_requests/http_requests.dart';
```

Let's make a simple HTTP request

```dart
var r = HttpRequests();
await r.get('https://google.com');
print(r.status());
```


### Some Methods
just like in python's request module, the `Response` object has this functionallity

- `r.status` - the response status code
- `r.url` - the url in the request 
- `r.headers` - the response headers 
- `r.success` - a boolean. `true` indicates that the request was a great success 
- `r.hasError` - a boolean. `true` indicates that the request was not a great success 
- `r.bytes` - return the body in the respone as a list of bytes 
- `r.content` - return the body in the respone as a string (with UTF-8)
- `r.contentLength` - return the response content lenght
- `r.contentType` - return the response content type `application/json`, 
- `r.isRedirect` - return the Redirection Status is `true` or `false`
- `r.response` - return the body in the respone as a string (without UTF-8 {take default})
- `r.json` - recodes the body in the respone and returns the result (dynamic type)
- `r.throwForStatus()` - will throw an exception if the response `statusCode` is not a great success.
