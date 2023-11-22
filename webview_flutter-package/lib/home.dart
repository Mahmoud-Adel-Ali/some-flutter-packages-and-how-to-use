import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: camel_case_types
class Web_view extends StatefulWidget {
  const Web_view({super.key});

  @override
  State<Web_view> createState() => _Web_viewState();
}

// ignore: camel_case_types
class _Web_viewState extends State<Web_view> {
  bool showContainer = false;
  var webViewController = WebViewController();
  choiseIcon(String path) {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color.fromARGB(255, 75, 75, 75))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int process) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith(path)) {
            return NavigationDecision.prevent;
          }

          // return NavigationDecision.navigate;
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse(path));
  }

  @override
  void initState() {
    super.initState();
    choiseIcon('https://www.youtube.com/');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text("Flutter Web View"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        choiseIcon('https://www.facebook.com/');
        
                        setState(() {
                          showContainer = true;
                        });
                      },
                      child: const Icon(
                        Icons.facebook,
                        size: 50,
                      )),
                  TextButton(
                      onPressed: () {
                        choiseIcon('https://www.youtube.com/');
        
                        setState(() {
                          showContainer = true;
                        });
                      },
                      child: const Text(
                        "Youtube",
                        style: TextStyle(fontSize: 25),
                      )),
                  TextButton(
                      onPressed: () {
                        choiseIcon('https://www.google.com/');
        
                        setState(() {
                          showContainer = true;
                        });
                      },
                      child: const Text(
                        "Google",
                        style: TextStyle(fontSize: 25),
                      )),
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: 555,
                child: showContainer
                    ? Container(
                        margin: const EdgeInsets.all(5),
                        height: 500,
                        width: double.infinity,
                        child: WebViewWidget(controller: webViewController))
                    : const Text(
                        "choise one of this to show in container",
                        style: TextStyle(fontSize: 20),
                      ),
              ),
            IconButton(onPressed: (){
            setState(() {
                    showContainer = false;
                  });
            }, icon: const Icon(Icons.delete,size: 40,)),
            ],
          )),
        ),
      ),
    );
  }
}
