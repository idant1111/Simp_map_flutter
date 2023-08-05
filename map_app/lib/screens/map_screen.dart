import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String? varValue;
  late InAppWebViewController _webViewController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (varValue == null) {
      varValue = ModalRoute.of(context)!.settings.arguments as String?;
    }
  }

  void handleRefresh() {
    _webViewController.reload();
  }

void handleOpenGoogleMaps() async {
  String routeData = await _webViewController.evaluateJavascript(source: "YOUR JAVASCRIPT CODE TO EXTRACT THE ROUTE DATA");
  String directionsUrl = 'https://www.google.com/maps/dir/?api=1&destination=$routeData&travelmode=driving';

  if (await canLaunch(directionsUrl)) {
    await launch(directionsUrl);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Unable to open Google Maps')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
        actions: [
          IconButton(
            onPressed: handleRefresh,
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse('https://www.google.com/maps/d/edit?mid=$varValue')),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: handleOpenGoogleMaps,
                child: Text('Open in Google Maps'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
