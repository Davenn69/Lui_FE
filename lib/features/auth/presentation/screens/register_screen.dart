import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/features/auth/presentation/widgets/register_widgets.dart';

class RegisterScreen extends ConsumerWidget{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: formKey,
              child: Stack(
                children: [Column(
                  children: <Widget>[
                    Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            "Email",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        showEmailTextFormField(ref, emailController)
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        showPasswordTextFormField(ref, passwordController)
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        showConfirmPasswordTextFormField(ref, confirmPasswordController, passwordController.text)
                      ],
                    ),
                  ],
                ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 550),
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xFF429690),
                              Color(0xFF2A7C76)
                            ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: ElevatedButton(onPressed: (){
                          if(!formKey.currentState!.validate()){

                          }
                          Navigator.of(context).pushReplacementNamed("/home");
                        }, child: Text("Register")),
                      ),
                    ),
                  )],
              ),
            ),
          ),
        ),
      ),
    );
  }
}