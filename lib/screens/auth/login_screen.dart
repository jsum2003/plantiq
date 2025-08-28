// lib/screens/auth/login_screen.dart

import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'package:plantiq/main.dart';
import '../dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()){
    
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1F2A),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF2B2F3A),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 600,
              height: 600,
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const PaginaInicio()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/Logo.png',
                      width: 400,
                    ),
                  ),
                  
                  const SizedBox(height: 25),

                  const Text(
                    'Inicio de sesión',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFE3E3E3),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //email
                        TextFormField(
                          controller: _emailController,
                          style: const TextStyle(color: Color(0xFFE3E3E3)),
                          decoration: InputDecoration(
                            labelText: 'Correo electronico',
                            labelStyle: const TextStyle(color: Color(0xFFE3E3E3)),
                            filled: true,
                            fillColor: Color(0xFF1C1F2A),
                            prefixIcon: Icon(Icons.email, color: Color(0xFFE3E3E3),),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:  BorderSide.none,
                              borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa tu correo';
                            }
                            if (!value.contains('@')) {
                              return 'Correo inválido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        //password
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          style: const TextStyle(color: Color(0xFFE3E3E3)),
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: const TextStyle(color: Color(0xFFE3E3E3)),
                            filled: true,
                            fillColor: Color(0xFF1C1F2A),
                            prefixIcon: Icon(Icons.password, color:Color(0xFFE3E3E3)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty ) {
                              return 'Por favor ingresa tu contraseña';
                            }
                            if (value.length < 6) {
                              return 'Minimo 6 caracteres';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
                        //boton 
                        Center(
                          child: GestureDetector(
                            onTap: _submitForm,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFFDA00FF), Color(0xFF7E0FF5),Color(0xFFDA00FF)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'Iniciar sesión',
                                style: TextStyle(
                                  color: Color(0xFFE3E3E3),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //enlace
                        Center(
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: Color(0xFFE3E3E3),
                                fontSize: 16,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'Si no te has inscrito registrate '
                                ),
                                WidgetSpan(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const RegisterScreen(),
                                        ),
                                      );
                                    },
                                    child: ShaderMask(
                                      shaderCallback:(bounds)=> const LinearGradient(
                                        colors: [
                                          Color(0xFFDA00FF), 
                                          Color(0xFF7E0FF5),
                                          Color(0xFFDA00FF),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ).createShader(bounds),
                                      child: Text(
                                        'aquí.',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  )
                                )
                              ]
                            ),
                          ),
                        )
                      ],
                    ),
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