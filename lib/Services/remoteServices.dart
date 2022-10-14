import 'package:http/http.dart' as http;

import '../Models/Countries.dart';

class RemoteServices {
//API Calling

  static Future<Countries?> fetchData() async {
    //This is Heroku's Link for backend Api that i created in Express js . Mobile app can't fetch data from local server hence i had to deploy the api at Heroku

    String link = "https://express-test-apis.herokuapp.com/countries";
    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return countriesFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }
}
