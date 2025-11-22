import 'package:movies_app/cubits/auth/auth_cubit.dart';
import 'package:movies_app/cubits/auth/auth_state.dart';
import 'package:movies_app/screens/home/bottom_nav/home_layout.dart';
import 'package:movies_app/screens/signup.dart';
import 'package:movies_app/widgets/logic/navigator.dart';
import 'package:movies_app/widgets/login_sign_widgets/signup_option.dart';
import 'package:movies_app/widgets/login_sign_widgets/signwith.dart';
import 'package:movies_app/widgets/login_sign_widgets/textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(17),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  'Hi Welcome back, you’ve been missed',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 39),
              CustomTextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  } else {
                    return null;
                  }
                },
                icon: Icons.email,
                text: 'Enter your email',
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  } else {
                    return null;
                  }
                },
                icon: Icons.visibility_off,
                text: 'Enter your password',
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    goTo(const Placeholder());
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xff588BF0)),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login Successful'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeLayout(),
                      ),
                      (route) => false,
                    );
                  }

                  if (state is AuthFailed) {
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
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              final email = emailController.text.trim();
                              final password = passwordController.text;
                              final authCubit = context.read<AuthCubit>();
                              authCubit.signIn(
                                email: email,
                                password: password,
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff588BF0),
                      minimumSize: const Size.fromHeight(56),
                    ),
                    child: state is AuthLoading
                        ? const CircularProgressIndicator(
                            color: Color(0xff588BF0),
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                  );
                },
              ),

              const SizedBox(height: 10),
              SignOption(
                text1: 'Don’t have an account?',
                text2: 'Sign Up',
                page: Signup(),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  SizedBox(width: 5),
                  Text(
                    'OR',
                    style: TextStyle(color: Color(0xffA1A8B0), fontSize: 16),
                  ),
                  SizedBox(width: 5),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 30),
              const Signwith(
                image: 'assets/icons/gogle.png',
                text: 'Sign in with google',
              ),
              const SizedBox(height: 16),
              const Signwith(
                image: 'assets/icons/apple.png',
                text: 'Sign in with Apple',
              ),
              const SizedBox(height: 16),
              const Signwith(
                image: 'assets/icons/facebook.png',
                text: 'Sign in with Facebook',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
