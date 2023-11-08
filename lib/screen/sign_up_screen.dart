import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
//Todo 1 Deklarasikan Variabel
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordControler = TextEditingController();

  String _errortext = '';

  bool _isSignedIn = false;

  bool _obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO : 2 pasang appBar
        appBar: AppBar(title: Text('Sign in'),),
        // TODO : 3 pasang body
        body: Center(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    child: Column(
                      // TODO: 4. Atur mainAxisAligment dan crossAxisAligment
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: "Jonathan Christian",
                            border: OutlineInputBorder()
                          ),
                        ),
                        // TODO: 5. Pasang TextFormField Nama Pengguna
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                              labelText: "Nama Pengguna",
                              border: OutlineInputBorder()
                          ),
                        ),
                        // TODO: 6. Pasang TextFormField Kata Sandi
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordControler,
                          decoration: InputDecoration(
                            labelText: "Kata Sandi",
                            errorText: _errortext.isNotEmpty ? _errortext : null,
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  _obsecurePassword = !_obsecurePassword;
                                });
                              },
                              icon: Icon(
                                _obsecurePassword ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          obscureText: _obsecurePassword,
                        ),
                        // TODO: 7. Pasang ElevatedButton Sign In
                        SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: (){},
                            child: Text('Sign In')),
                        // TODO: 8 Pasang TextButton Sign UP
                        SizedBox(height: 10),
                        //
                        RichText(
                            text: TextSpan(
                                text: 'Belum punya akun? ',
                                style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Daftar di sini.',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        fontSize: 16
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  )
                                ]
                            )
                        )
                      ],
                    ),
                  )
              ),
            )
        )
    );
  }
}