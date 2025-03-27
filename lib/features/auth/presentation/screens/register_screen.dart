import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/core/params/params.dart';
import 'package:lui_fe/core/widgets/show_dialog.dart';
import 'package:lui_fe/features/auth/presentation/providers/auth_provider.dart';
import 'package:lui_fe/features/auth/presentation/widgets/register_widgets.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (previous, next) {
      if (next.error != null) {
        ShowDialog.showErrorDialog(context: context, title: "Email in used", description: next.error!);
      }

      if (!next.isLoading && next.error == null) {
        Navigator.of(context).pushReplacementNamed("/home");
      }
    });

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
                            "Name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        showNameTextFormField(ref, nameController)
                      ],
                    ),
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
                          "Confirm Password",
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
                Consumer(
                  builder: (context, ref, child) {
                    final authState = ref.watch(authProvider);
                    final authNotifier = ref.read(authProvider.notifier);

                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 550),
                        child: authState.isLoading 
                          ? CircularProgressIndicator()
                          : Container(
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
                                if(formKey.currentState!.validate()){
                                  final params = RegisterParams(
                                    name: nameController.text,
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                  );
                                  authNotifier.register(params);
                                }
                              }, child: Text("Register")),
                            ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}