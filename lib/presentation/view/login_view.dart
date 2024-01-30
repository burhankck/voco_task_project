import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_task_project/app/voco_app.dart';
import 'package:voco_task_project/data/resources/route_manager/route_constant.dart';
import 'package:voco_task_project/main.dart';

class LoginView extends ConsumerStatefulWidget {
  @override
  ConsumerState<LoginView> createState() => _ConsumerLoginPageState();
}

class _ConsumerLoginPageState extends ConsumerState<LoginView> with _PageProperties {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: CircleAvatar(
                  maxRadius: 75,
                  child: Image.asset(
                    'assets/vocoo.png',
                  ),
                ),
              ),
              SizedBox(height: 70),
              Container(
                width: 400,
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Bu alan boş geçilemez.';
                    }
                    return null;
                  },
                  autofillHints: const [AutofillHints.username],
                  keyboardType: TextInputType.name,
                  controller: emailController,
                  maxLength: 35,
                  decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.people, color: Colors.purple.shade600),
                    labelText: 'Kullanıcı Adı',
                  ),
                  // inputFormatters: [
                  //   LengthLimitingTextInputFormatter(15),
                  // ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: 400,
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Bu alan boş geçilemez.';
                    }
                    return null;
                  },
                  autofillHints: const [AutofillHints.password],
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: ref.watch(LoginProvider).isSecure,
                  obscuringCharacter: _obsureText,
                  controller: passwordController,
                  maxLength: 35,
                  decoration: InputDecoration(
                      labelText: 'Şifre',
                      prefixIcon: Icon(
                        Icons.key_outlined,
                        color: Colors.purple.shade600,
                      ),
                      suffix: IconButton(
                        onPressed: () {
                          ref.watch(LoginProvider).changeIsSecure();
                        },
                        icon: Consumer(
                          builder: (context, WidgetRef ref, child) {
                            return ref.watch(LoginProvider).isSecure
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off_rounded);
                            // return Icon(
                            //     color: Colors.purple.shade500,
                            //     ref.watch(LoginProvider).isSecure
                            //         ? Icons.visibility
                            //         : Icons.visibility_off);
                          },
                        ),
                      )),
                  // inputFormatters: [
                  //   LengthLimitingTextInputFormatter(15),
                  // ],
                ),
              ),
              SizedBox(height: 32),
              Consumer(
                builder: (context, WidgetRef ref, child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ref.watch(LoginProvider).isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple.shade600,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0))),
                            onPressed: () async {
                              await _isAuthSuccess(ref);
                              // Navigator.pushReplacementNamed(
                              //     context, RouteConstant.homeRoute);
                            },
                            child: Text(
                              'Giriş Yap',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _isAuthSuccess(WidgetRef ref) async {
    await ref.watch(LoginProvider).userAuth(
              page: 1,
              password: passwordController.text,
              userEmail: emailController.text,
            )
        ? _navigateToHome()
        : null;
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, RouteConstant.homeRoute);
  }
}

mixin _PageProperties {
  final String _obsureText = "*";
  final TextEditingController emailController =
      TextEditingController(text: "eve.holt@reqres.in");
  final TextEditingController passwordController =
      TextEditingController(text: "cityslicka");
}
