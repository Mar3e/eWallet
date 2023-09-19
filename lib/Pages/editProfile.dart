import 'package:flutter/material.dart';
import '../Models/dummyData.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final user = users[0];

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: user.userName);
    _emailController = TextEditingController(text: user.userEmail);
    _phoneController = TextEditingController(text: user.userPhone.toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    setState(() {
      user.userName = _nameController.text;
      user.userEmail = _emailController.text;
      user.userPhone = int.parse(_phoneController.text);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'إدارة الحساب',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _saveChanges,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'الاسم',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'أدخل اسمك هنا',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'البريد الإلكتروني',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'أدخل بريدك الإلكتروني هنا',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'الهاتف الجوال',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  hintText: 'أدخل رقم هاتفك الجوال',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
