import 'package:flutter/material.dart';

import '../views/signup.dart';

class SignInView extends StatelessWidget {
 
   SignInView({Key? key}) : super(key: key);


 
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "مرحباً",
                      style: TextStyle(
                          fontSize: 48, fontWeight: FontWeight.bold),
                    )),
                const Text(
                  "أدخل بريدك الالكتروني لتسجيل الدخول",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'البريد الالكتروني',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "الرجاء ادخل بريدك الإلكتروني";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: 'كلمة المرور',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              //! setState(() {
                              //   _obscureText = !_obscureText;
                              // });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "الرجاء ادخل كلمة المرور ";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 4.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            // Handle forgot password logic here
                          },
                          child: const Text(
                            'هل نسيت كلمة المرور؟',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                         //ToDO : login logic
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "لا تملك حساب ؟",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w700,
                              fontSize: 17.0,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "سجل الان",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17.0,
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
