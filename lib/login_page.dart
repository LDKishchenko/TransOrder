import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  void _showRegisterDialog() {
    showDialog(
      context: context,
      builder: (context) => const RegisterDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                child: Center(
                  child: Text(
                    'TransOrder',
                    style: GoogleFonts.montserrat(
                      color: Colors.blue,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image.asset(
                  'assets/truck.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _CustomTextField(
                          controller: _loginController,
                          label: 'Логін',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Введіть логін';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        _CustomTextField(
                          controller: _passwordController,
                          label: 'Пароль',
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Введіть пароль';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _ActionButton(
                              text: 'Увійти',
                              onPressed: () {
                                if (_loginFormKey.currentState?.validate() ?? false) {
                                  // TODO: Реалізувати логіку входу
                                }
                              },
                            ),
                            const SizedBox(width: 16),
                            GestureDetector(
                              onTap: _showRegisterDialog,
                              child: const Text(
                                'Зареєструватися',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterDialog extends StatefulWidget {
  const RegisterDialog({Key? key}) : super(key: key);

  @override
  State<RegisterDialog> createState() => _RegisterDialogState();
}

class _RegisterDialogState extends State<RegisterDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Реєстрація',
          style: GoogleFonts.montserrat(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _registerFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _CustomTextField(
                controller: _emailController,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введіть email';
                  }
                  final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,}');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Некоректний email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              _CustomTextField(
                controller: _passwordController,
                label: 'Пароль',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введіть пароль';
                  }
                  if (value.length < 6) {
                    return 'Пароль має містити щонайменше 6 символів';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              _CustomTextField(
                controller: _confirmPasswordController,
                label: 'Підтвердження паролю',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Підтвердіть пароль';
                  }
                  if (value != _passwordController.text) {
                    return 'Паролі не співпадають';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              _CustomTextField(
                controller: _phoneController,
                label: 'Номер телефону',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введіть номер телефону';
                  }
                  final phoneRegex = RegExp(r'^\+?\d{10,15}');
                  if (!phoneRegex.hasMatch(value)) {
                    return 'Некоректний номер телефону';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              _CustomTextField(
                controller: _firstNameController,
                label: "Ім'я",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введіть ім\'я';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              _CustomTextField(
                controller: _lastNameController,
                label: 'Прізвище',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введіть прізвище';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CancelButton(
              onPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(width: 12),
            _ActionButton(
              text: 'Зареєструватися',
              width: 160,
              onPressed: () {
                if (_registerFormKey.currentState?.validate() ?? false) {
                  // TODO: Реалізувати логіку реєстрації
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double fontSize;

  const _ActionButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 120,
    this.height = 36,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: fontSize)),
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _CancelButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        'Скасувати',
        style: TextStyle(fontSize: 10),
      ),
    );
  }
} 