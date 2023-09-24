import 'package:ewalletapp/views_models/auth_view_model.dart';
import 'package:ewalletapp/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../views/signup.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
        builder: (_, authViewModel, __) => Scaffold(
              resizeToAvoidBottomInset: true,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: authViewModel.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "مرحباً",
                          style: TextStyle(
                              fontSize: 48, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "أدخل بريدك الالكتروني لتسجيل الدخول",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        ),
                        const SizedBox(height: 25.0),
                        TextFormField(
                          controller: authViewModel.emailController,
                          validator: (value) => authViewModel.emailValidator(),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'البريد الالكتروني',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          obscureText: authViewModel.obscureText,
                          controller: authViewModel.passWordController,
                          validator: (value) =>
                              authViewModel.passWordValidator(),
                          decoration: InputDecoration(
                            labelText: 'كلمة المرور',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                                icon: Icon(authViewModel.obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () =>
                                    authViewModel.toggleObscureText()),
                          ),
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
                          onPressed: () => authViewModel.signIn().then((value) {
                            if (!value) {
                              ShowAlertDialog().showAlert(
                                  context: context,
                                  title: "حدث خطأ ما",
                                  content:
                                      "لم يتم العثور على المستخدم تأكد من إدخال البيانات بشكل صحيح");
                            }
                          }),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
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
                                      builder: (context) => const SignUpPage(),
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
                ),
              ),
            ));
  }
}
