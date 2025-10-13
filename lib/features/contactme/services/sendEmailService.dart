import 'dart:convert';
import 'package:http/http.dart' as http;

class Sendemailservice {
  static sendEmail({required String name, required String message}) async {
    var endPointUrl = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    var response = await http.post(
      endPointUrl,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': 'service_kg9xe5s',
        'template_id': 'template_6ka8gm1',
        'user_id': 'FyK2zUrBMxzmTJqxB',
        'template_params': {'user_name': name, 'user_message': message},
      }),
    );
    if (response.statusCode == 200) {
      print('Email sent successfully!');
      return true;
    } else {
      print('Failed to send email. Status code: ${response.statusCode}');
      return false;
    }
  }
}
