import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voco_task_project/data/resources/route_manager/route_constant.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _obsureText = "*";
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade600,
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'VOCO App Giriş',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: CircleAvatar(
                maxRadius: 60,
                child: Image.asset(
                  'assets/vocoo.png',
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 400,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextField(
                autofillHints: const [AutofillHints.username],
                keyboardType: TextInputType.name,
                controller: usernameController,
                maxLength: 8,
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(8),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 400,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextField(
                autofillHints: const [AutofillHints.password],
                keyboardType: TextInputType.visiblePassword,
                obscureText: _isSecure,
                obscuringCharacter: _obsureText,
                controller: passwordController,
                maxLength: 6,
                decoration: InputDecoration(
                    labelText: 'Şifre',
                    suffix: IconButton(
                      onPressed: () {
                        _changeLoading();
                      },
                      icon: Icon(
                          color: Colors.purple.shade500,
                          _isSecure ? Icons.visibility : Icons.visibility_off),
                    )),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteConstant.homeRoute);
                },
                child: Text('Giriş Yap'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
