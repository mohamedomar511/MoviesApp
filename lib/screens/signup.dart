import 'package:movies_app/cubits/auth/auth_cubit.dart';
import 'package:movies_app/cubits/auth/auth_state.dart';
import 'package:movies_app/screens/login_screen.dart';
import 'package:movies_app/widgets/logic/navigator.dart';
import 'package:movies_app/widgets/login_sign_widgets/check_box.dart';
import 'package:movies_app/widgets/login_sign_widgets/signup_option.dart';
import 'package:movies_app/widgets/login_sign_widgets/textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: emailController,
                icon: Icons.mail,
                text: 'Enter your email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: passwordController,
                icon: Icons.visibility_off,
                text: 'Enter your password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(0, -3),
                    child: CustomCheckBox(),
                  ),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'I agree to the medidoc ',
                          style: TextStyle(fontSize: 14),
                        ),

                        TextSpan(
                          text: 'Terms of Service ',
                          style: TextStyle(
                            color: Color(0xff588BF0),
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: '\nand ',
                          style: TextStyle(fontSize: 14),
                        ),
                        TextSpan(
                          text: 'Privacy Policy ',
                          style: TextStyle(
                            color: Color(0xff588BF0),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 38),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is RegisterSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Sign Up Successful'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    goOff(LoginScreen());
                  }

                  if (state is RegisterFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid email or password'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }

                  if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is RegisterLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              final email = emailController.text.trim();
                              final password = passwordController.text;
                              final authCubit = context.read<AuthCubit>();
                              authCubit.signUp(
                                email: email,
                                password: password,
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff588BF0),
                      minimumSize: const Size.fromHeight(56),
                    ),
                    child: state is RegisterLoading
                        ? const CircularProgressIndicator()
                        : const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          ),
                  );
                },
              ),

              const SizedBox(height: 24),
              SignOption(
                text1: 'Already have an account?',
                text2: 'Log in',
                page: LoginScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
