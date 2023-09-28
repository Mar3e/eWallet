import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../views_models/auth_view_model.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (_, authViewModel, __) => Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: authViewModel.signUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "إنشاء حساب",
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      controller: authViewModel.nameController,
                      decoration: const InputDecoration(
                        labelText: 'الاسم كامل',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.person),
                      ),
                      validator: (value) => authViewModel.userNameValidator(),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: authViewModel.emailController,
                      decoration: const InputDecoration(
                        labelText: 'البريد الإلكتروني',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.email_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => authViewModel.emailValidator(),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: authViewModel.phoneController,
                      decoration: const InputDecoration(
                        labelText: 'رقم الهاتف',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) => authViewModel.phoneValidator(),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: authViewModel.passWordController,
                      obscureText: authViewModel.obscureText,
                      validator: (value) => authViewModel.passWordValidator(),
                      decoration: InputDecoration(
                        labelText: 'كلمة المرور',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            icon: Icon(authViewModel.obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () => authViewModel.toggleObscureText()),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 16.0),
                    // ElevatedButton(
                    //   child: const Text(
                    //     'أنشاء الحساب',
                    //     style: TextStyle(
                    //         fontSize: 22.0, fontWeight: FontWeight.bold),
                    //   ),
                    //   onPressed: () => authViewModel.signUp().then(
                    //     (value) {
                    //       if (!value) {
                    //         ShowAlertDialog().showAlert(
                    //             context: context,
                    //             title: "حدث خطأ ما",
                    //             content:
                    //                 "لم يتم العثور على المستخدم تأكد من إدخال البيانات بشكل صحيح");
                    //       } else {
                    //         Navigator.pop(context);
                    //       }
                    //     },
                    //   ),
                    // ),
                    const SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "تملك حساب ؟",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w700,
                            fontSize: 17.0,
                          ),
                        ),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "سجل الدخول الان",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17.0,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
