import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynewsapp/Functions/authFunctions.dart';
////////////////////////// Sign Up & Login Page ////////////////////////////
class AuthFormWidget extends StatefulWidget {
  const AuthFormWidget({super.key});

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  final _formkey = GlobalKey<FormState>();
  bool isSignup = false;
  String email = '';
  String password= '';
  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'), 
        backgroundColor: Colors.deepPurple,
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             !isSignup?  TextFormField(
                key: ValueKey('username'),
                decoration: InputDecoration(hintText: "Enter Username"),
                validator: (value){
                  if (value.toString().length<3) {
                    return 'Username is too small';
                  }else{
                    return null;
                  }
                },
                onSaved: (value){
                  setState(() {
                    username = value!;
                  });
                },
              ):Container(),
              TextFormField(
                key: ValueKey('email'),
                decoration: InputDecoration(hintText: "Enter Email"),
                validator: (value){
                  if (!(value.toString().contains('@'))) {
                    return 'Invalid Email';
                  }else{
                    return null;
                  }
                },
                onSaved: (value){
                  setState(() {
                    email = value!;
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                key: ValueKey('password'),
                decoration: InputDecoration(hintText: "Enter Password"),
                validator: (value){
                  if (value.toString().length<6) {
                    return 'Password is too small';
                  }else{
                    return null;
                  }
                },
                onSaved: (value){
                  setState(() {
                    password = value!;
                  });
                },
              ),

              SizedBox(height: 20),

              Container(
                width: double.infinity,
                color: Colors.purple,
                height: 50,
                child: 
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                    onPressed: (){
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        isSignup? signin(email, password):signup(email, password);
                      }
                    }, child: isSignup? Text('Login'):Text('Signup'),
                  )
                ),
                SizedBox(height: 10),

                TextButton(onPressed: (){
                  setState(() {
                    isSignup = !isSignup;
                  });
                }, 
                child: isSignup? Text("Don't have an account? Signup"):Text('Already Signed Up? Login'))
            ],
          ),
        ),
      ),
    );
  }
}