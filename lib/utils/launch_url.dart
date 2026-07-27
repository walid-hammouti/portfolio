import 'package:url_launcher/url_launcher.dart';

Future<void> launchAppUrl(String link) async {
  final Uri url = Uri.parse(link);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $link');
  }
}
