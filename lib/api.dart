import 'package:http/http.dart' as http;

class Api {
  final String _Url = "http://192.168.1.92:5000";

  authData(data, apiUrl) async {
    var fullUrl = _Url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: data,
    );
  }

  getData(apiUrl) async{
    var fullUrl = _Url + apiUrl;
    return await http.get(
      Uri.parse(fullUrl)
    );
  }
}
