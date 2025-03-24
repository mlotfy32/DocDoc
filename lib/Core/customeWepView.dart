import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Customewebview extends StatefulWidget {
  const Customewebview({super.key, required this.url});
  final String url;
  @override
  State<Customewebview> createState() => _CustomewebviewState();
}

class _CustomewebviewState extends State<Customewebview> {
  late final WebViewController controller;
  bool isLoading = true;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Stack(
          children: [
            WebViewWidget(
              controller: controller,
            ),
            if (isLoading == true)
              const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
