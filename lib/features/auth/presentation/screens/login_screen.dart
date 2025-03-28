import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/core/params/params.dart';
import 'package:lui_fe/core/session/presentation/providers/providers.dart';
import 'package:lui_fe/core/utils/navigation_service.dart';

import '../../../../core/widgets/show_dialog.dart';
import '../providers/auth_provider.dart';
import '../widgets/register_widgets.dart';

class LoginScreen extends ConsumerWidget{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    ref.listen(authProvider, (previous, next) {
      if (next.error != null) {
        ShowDialog.showErrorDialog(context: context, title: "Invalid Login", description: next.error!);
      }

      if (!next.isLoading && next.error == null) {
        ShowDialog.showSuccessDialog(context: context, title: "Success", description: "Login is successful", onOkPressed: (){Navigator.of(context).push(NavigationService.navigationFromLoginToHome());});
        ref.read(saveSessionUsecaseProvider).call(next.loginResponse!.data?['accessToken'], next.loginResponse!.data?['refreshToken']);
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
                      "Login",
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
                  ],
                ),
                  Consumer(
                      builder: (context, ref, child){
                        final authState = ref.watch(authProvider);
                        final authNotifier = ref.read(authProvider.notifier);

                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 550),
                            child: authState.isLoading ? CircularProgressIndicator() : Container(
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
                                  final params = LoginParams(email: emailController.text, password: passwordController.text);
                                  print(passwordController.text);
                                  authNotifier.login(params);
                                }
                              }, child: Text("Login")),
                            ),
                          ),
                        );
                      }
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