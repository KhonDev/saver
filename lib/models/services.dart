import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> getData() async {
  final response = await http.get(
    Uri.parse('http://localhost:8080/api/auth/personal-data'),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data); // API dan kelgan ma'lumotlarni ekranga chiqarish
  } else {
    print('Failed to load data');
  }
}
