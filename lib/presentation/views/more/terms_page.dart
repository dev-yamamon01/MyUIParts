import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/utils/terms_utils.dart';
import '../../../core/constants/app_color.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  WebViewController _controller = WebViewController();
  bool isLoading=false;

  @override
  void initState() {
    super.initState();

    isLoading=true;
    TermsUtils.loadTermsAndApplyWebViewController(controller: _controller);
    setState(() {
      isLoading=false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('利用規約')
      ),
      body: !isLoading ? WebViewWidget(controller: _controller)
          : Center(
        child: CircularProgressIndicator(
          color: AppColors.primary
        )
      ),
    );
  }
}
