import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const ToastMessag(),
    );
  }
}

class ToastMessag extends StatefulWidget {
  const ToastMessag({super.key});

  @override
  State<ToastMessag> createState() => _ToastMessagState();
}

class _ToastMessagState extends State<ToastMessag> {
  bool isAccept = false;
  toastMessag({required String msg, required Color myColor}) {
    return Fluttertoast.showToast(
        msg: msg,
        backgroundColor: myColor,
        fontSize: 20.0,
        timeInSecForIosWeb: 3,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM_RIGHT);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 253, 203, 19),
        title: const Text("Flutter Toast"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: isAccept,
              onChanged: (valueKey) {
                setState(() {
                  isAccept = !isAccept;
                });
              },
              tristate: true,
              activeColor: Colors.amber,
            ),
            MaterialButton(
              onPressed: () {
                isAccept
                    ? toastMessag(msg: 'successful', myColor: Colors.green)
                    : toastMessag(msg: 'error......', myColor: Colors.redAccent);
              },
              animationDuration: const Duration(seconds: 5),
              color: const Color.fromARGB(255, 217, 168, 20),
              child: const Text(
                "Check Vaild",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
