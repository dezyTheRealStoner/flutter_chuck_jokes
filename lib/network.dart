import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ChuckJoke {
  ChuckJoke({required this.joke, required this.imageUrl});

  final String joke;
  final String imageUrl;

  factory ChuckJoke.fromJson(Map<String, dynamic> json) {
    return ChuckJoke(
      joke: json['value'],
      imageUrl: json['icon_url'],
    );
  }
}

Future<ChuckJoke> getJoke() async {
  var url = Uri.https('api.chucknorris.io', '/jokes/random');

  var response = await http.get(url, headers: {"accept": "application/json"});

  if (response.statusCode == 200) {
    return ChuckJoke.fromJson(convert.jsonDecode(response.body));
  } else {
    print(response.statusCode);
    return ChuckJoke(imageUrl: '', joke: '');
  }
}
