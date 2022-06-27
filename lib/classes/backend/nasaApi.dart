import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:planetaex/classes/nasapicday.dart';

Future<nasapicinfo> getinfoNasaPic() async {
  return await http
      .get(Uri.parse(
          "https://api.nasa.gov/planetary/apod?count=1&api_key=dbe6edph2ERURm"
          "gK9SAXJamsQW0raWkFJwNRzFGG"))
      .then((value) {
    if (value.statusCode != 404) {
      var decoded = jsonDecode(value.body);
      return nasapicinfo(decoded[0]["title"], decoded[0]["hdurl"],
          decoded[0]["explanation"], decoded[0]["date"]);
    } else {
      return nasapicinfo("as", "asas", "asas", "asas");
    }
  });
}
