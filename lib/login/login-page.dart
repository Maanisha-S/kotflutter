import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../tables/ui/all_tables_page.dart';

// library email_otp;

class waiter extends StatefulWidget {
  // const ResetPasswordPage({super.key});

  @override
  State<waiter> createState() => _waiterState();
}

class _waiterState extends State<waiter> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();

  // void Verify(String email) async {
  //   try {
  //     http.Response response = await http.post(
  //       Uri.parse('https://vinsupinfotech.com/FMS/public/api/forgot'),
  //       body: {'email': email},
  //     );
  //     if (response.statusCode == 200) {
  //       print("Verify");
  //       Navigator.push(
  //         context,
  //         PageRouteBuilder(
  //           pageBuilder: (c, a1, a2) => LoginUiPage(),
  //           transitionsBuilder: (c, anim, a2, child) =>
  //               FadeTransition(opacity: anim, child: child),
  //           transitionDuration: const Duration(milliseconds: 1000),
  //         ),
  //       );
  //       // Navigate to the next screen or update UI accordingly
  //     } else {
  //       // Login failed, handle errors
  //       print('failed');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: Colors.red,
  //           elevation: 10,
  //           behavior: SnackBarBehavior.floating,
  //           content: const Text(
  //             'Enter Valid Email...',
  //             style: TextStyle(color: Colors.white, fontSize: 19),
  //           ),
  //           action: SnackBarAction(
  //             label: 'ok',
  //             textColor: Colors.yellow,
  //             onPressed: () {
  //               // Code to execute.
  //             },
  //           ),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Image.asset("images/vinsup logo.png"),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Welcome to TIGER CAFE',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: 400,
                          height: 200,
                          child: Image.asset("images/waiter.png"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 28.0),
                        child: const Text(
                          " Waiter's name:",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: 'Murugan',
                            hintStyle: TextStyle(
                              fontSize: 25.0,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: const Text(
                          " Enter 4 digit pin:",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            myInputBox(context, txt1),
                            SizedBox(
                              width: 2,
                            ),
                            myInputBox(context, txt2),
                            SizedBox(
                              width: 2,
                            ),
                            myInputBox(context, txt3),
                            SizedBox(
                              width: 2,
                            ),
                            myInputBox(context, txt4),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 50.0,
                    width: 180.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the success dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirstTables()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget myInputBox(BuildContext context, TextEditingController controller) {
  return Container(
    height: 50,
    width: 40,
    decoration: BoxDecoration(
      border: Border.all(width: 2),
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: TextField(
      controller: controller,
      maxLength: 1,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 35),
      decoration: InputDecoration(
        counterText: '',
      ),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}
