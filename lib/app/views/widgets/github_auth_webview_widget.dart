//
//  repopix
//  github_auth_webview_widget
//
//  Created by Ngonidzashe Mangudya on 04/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../shared/configs/colors.dart';
import '../../../shared/extensions/context.dart';

class GithubAuthWebviewWidget extends StatefulWidget {
  const GithubAuthWebviewWidget({super.key});

  @override
  State<GithubAuthWebviewWidget> createState() =>
      _GithubAuthWebviewWidgetState();
}

class _GithubAuthWebviewWidgetState extends State<GithubAuthWebviewWidget> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.background)
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error) {
            context.notify(
              error.description,
              isError: true,
            );
            controller
                .loadRequest(Uri.parse('https://github.com/login/device'));
          },
          onNavigationRequest: (NavigationRequest request) {
            final Uri uri = Uri.parse(request.url);
            // if url is https://github.com/login/device/success, close page and return true
            if (uri.pathSegments.contains('success')) {
              context.goBack(value: true);
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://github.com/login/device'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: controller,
    );
  }
}
