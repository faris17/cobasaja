import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';
import 'package:m_angkutan/loginAnimation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Mobile-Angkutan',
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  var statusClick =0;

  AnimationController animationControllerButton;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationControllerButton = AnimationController(duration: Duration(seconds: 3),vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationControllerButton.dispose();
  }

  Future<Null> _playAnimation() async{
    await animationControllerButton.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage('img/bg.jpg'), fit: BoxFit.cover),
      ),
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color.fromRGBO(162, 146, 199, 0.8),
                Color.fromRGBO(51, 51, 63, 0.9),
              ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 370.0),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person_outline,
                                  color: Colors.white,
                                ),
                                hintText: "Username"),
                          ),
                          Padding(padding: const EdgeInsets.all(10.0)),
                          TextField(
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.white,
                                ),
                                hintText: "Password"),
                          ),

                          FlatButton(padding: const EdgeInsets.only(top:420.0, bottom:30.0),
                            onPressed: null,
                            child: Text("Don't have an account ? Sign Up here",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.5
                            ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                  statusClick==0 ?
                      new InkWell(
                        onTap: (){
                          setState((){
                            statusClick=1;
                          });
                          _playAnimation();
                        },
                          child: new SignIn()
                      ):
                     new StartAnimation(buttonControler: animationControllerButton.view,)
                ],
              )
            ],
          )),
    ));
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(65.0),
      child:new Container(
        alignment: FractionalOffset.center,
          width: 320.0,
          height: 60.0,
          decoration: BoxDecoration(color:Colors.yellow[700],
              borderRadius: BorderRadius.all(const Radius.circular(30.0))
          ),
          child: Text("Sign In",
            style: TextStyle(color:Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.3),)
      ),
    );
  }
}

