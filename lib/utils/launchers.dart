import 'package:url_launcher/url_launcher.dart';

void openUrl({required String url}) {
  launchUrl(Uri.parse(url));
}
