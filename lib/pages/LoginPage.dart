import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart';
import '../constants.dart';

class LoginPage extends StatelessWidget {
  final String url;

  LoginPage({ this.url });

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: WebView(
          initialUrl: this.url,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (request) async {
            Uri uri = Uri.parse(request.url);

            if (uri.path == '/sso/github/callback' && uri.queryParameters['code'] != null) {
              String code = uri.queryParameters['code'];
              Uri authUri = Uri(scheme: 'https', host: 'github.com', path: '/login/oauth/access_token', queryParameters: {
                'client_id': GITHUB_CLIENT_ID,
                'client_secret': GITHUB_CLIENT_SECRET,
                'code': code
              }); 

              Response response = await post(authUri);
              Map<String, String> qs = Uri.splitQueryString(response.body);

              Navigator.pop<String>(context, qs['access_token']);

              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          }
        ),
      )
    );
  }
}
