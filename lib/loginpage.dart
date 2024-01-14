import 'package:flutter/material.dart';
import 'package:project_06/successpage.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
              children: [Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,//Flexible widget can be used if there is a risk of overflow form scree
                            children: [SizedBox(
                              height: 60,
                              width: 60,
                              child: Image.asset("assets/images/logo.png"),
                            ),
                              const Text(
                                "Flutter",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'
                                ),
                              )
                            ]
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Email can't be empty";
                            }
                            else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
                            {
                              return "Please enter a valid email";
                            }
                            else {return null;}
                          },
                          style: const TextStyle(fontSize: 15),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Email",
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Password can't be empty";
                            }
                            else if(value.length<8)
                            {
                              return "Password must be least 8 characters";
                            }
                            else {return null;}
                          },
                          style: const TextStyle(fontSize: 15),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Password",
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.red
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: _loginValidator(),
                          child: Container(
                            width: 300,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.indigoAccent,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Text("Login",style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text("Don't have an account? Sign Up")
                      ],
                    ),
                  ),
                ),
              ),]
          ),
        )
    );
  }
  _loginValidator()
  {
    if(_formKey.currentState!=null && _formKey.currentState!.validate()){
      // print("Clicked");
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const successpage()));
    }

  }
}
