// Stub file for web platform - webview_flutter doesn't work on web
// This prevents import errors when compiling for web

import 'package:flutter/material.dart';

// These are dummy classes that will never be instantiated on web
class WebViewController {
  WebViewController();
  void setJavaScriptMode(dynamic mode) {}
  void setBackgroundColor(dynamic color) {}
  void setNavigationDelegate(dynamic delegate) {}
  void loadRequest(dynamic uri) {}
  void reload() {}
}

class WebViewWidget extends StatelessWidget {
  final dynamic controller;
  const WebViewWidget({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

enum JavaScriptMode { unrestricted }

class NavigationDelegate {
  NavigationDelegate({
    void Function(String url)? onPageStarted,
    void Function(String url)? onPageFinished,
    void Function(WebResourceError error)? onWebResourceError,
  });
}

class WebResourceError {
  final String description;
  WebResourceError(this.description);
}
