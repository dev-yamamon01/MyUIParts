import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class TermsUtils {
  static final TermsUtils _instance = TermsUtils._internal();

  factory TermsUtils() => _instance;

  TermsUtils._internal();

  static Future<void> loadTermsAndApplyWebViewController(
      {required WebViewController controller}) async {
    // _controller = WebViewController()
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);

    final htmlTemplate = await rootBundle.loadString('assets/doc/terms.html');

    // 画像をBase64に
    final imageABytes = await rootBundle.load('assets/logo/matsuo_logo.jpeg');
    final base64ImageA = base64Encode(imageABytes.buffer.asUint8List());

    // 画像をBase64に
    final imageBBytes = await rootBundle.load('assets/logo/otatech_logo.png');
    final base64ImageB = base64Encode(imageBBytes.buffer.asUint8List());

    // HTML内のプレースホルダを置き換え
    final htmlContent = htmlTemplate
        .replaceAll('{{LOGO_IMAGE_A}}', base64ImageA)
        .replaceAll('{{LOGO_IMAGE_B}}', base64ImageB);

    controller.loadHtmlString(htmlContent);
  }

  static Future<bool> showTermsAgreement({required BuildContext context}) async{
    final controller = WebViewController();
    TermsUtils.loadTermsAndApplyWebViewController(controller: controller);

    final agreed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return _TermsDialog(controller: controller);
      },
    );
    return agreed ?? false;
  }
}

class _TermsDialog extends StatefulWidget {
  final WebViewController controller;
  
  const _TermsDialog({required this.controller});

  @override
  State<_TermsDialog> createState() => _TermsDialogState();
}

class _TermsDialogState extends State<_TermsDialog> {
  DateTime? _lastBackPressed;
  OverlayEntry? _overlayEntry;

  void _showExitMessage() {
    // Remove any existing overlay
    _overlayEntry?.remove();
    
    // Create overlay entry that appears at the bottom of the screen
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 30, // Much closer to bottom of screen
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "もう一度戻るボタンを押すとアプリを終了します",
              style: TextStyle(color: Colors.white, fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
    
    // Insert overlay
    Overlay.of(context).insert(_overlayEntry!);
    
    // Auto-remove after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  Future<bool> _handleBackPress() async {
    final now = DateTime.now();
    
    if (_lastBackPressed == null || 
        now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
      _lastBackPressed = now;
      
      // Show custom overlay message above dialog
      _showExitMessage();
      
      return false; // Don't dismiss dialog
    } else {
      // Second back press within 2 seconds - exit app directly
      SystemNavigator.pop();
      return false; // This won't be reached, but for safety
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenHeight < 600 || screenWidth < 400;
    final isTablet = screenWidth > 600;
    
    // Responsive dimensions
    final dialogHeight = isSmallScreen 
        ? screenHeight * 0.85  // Use more screen space on small devices
        : isTablet 
            ? screenHeight * 0.65  // Less space on tablets
            : screenHeight * 0.75; // Default for medium phones
    
    final webViewHeight = isSmallScreen
        ? dialogHeight * 0.75  // More space for content on small screens
        : dialogHeight * 0.8;
        
    final horizontalPadding = isSmallScreen ? 12.0 : isTablet ? 32.0 : 20.0;
    final titleFontSize = isSmallScreen ? 16.0 : isTablet ? 20.0 : 18.0;
    final buttonPadding = isSmallScreen ? 8.0 : 12.0;
    final borderRadius = isSmallScreen ? 12.0 : 16.0;

    return WillPopScope(
      onWillPop: _handleBackPress,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: isSmallScreen ? 16.0 : 20.0,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: dialogHeight,
            maxWidth: isTablet ? 600 : double.infinity,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: isSmallScreen ? 12.0 : 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Text(
                  '利用規約',
                  style: TextStyle(
                    fontSize: titleFontSize, 
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Divider(),
              Flexible(
                child: Container(
                  height: webViewHeight,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 8.0 : 16.0,
                  ),
                  child: WebViewWidget(controller: widget.controller),
                ),
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.all(buttonPadding),
                child: SizedBox(
                  width: double.infinity,
                  height: isSmallScreen ? 44.0 : 48.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true); // 同意 → 閉じる
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      '同意する',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14.0 : 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}