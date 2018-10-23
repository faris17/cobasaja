import "package:flutter/material.dart";

class StartAnimation extends StatefulWidget {
  StartAnimation({Key key, this.buttonControler})
  : shrinkButtonAnimation = new Tween(
    begin: 320.0,
    end: 70.0,
  ).animate(buttonControler),
  super(key:key);

  final AnimationController buttonControler;
  final Animation shrinkButtonAnimation;


  Widget _buildAnimation(BuildContext context, Widget child){
    return Padding(
      padding: const EdgeInsets.all(65.0),
      child:new Container(
          alignment: FractionalOffset.center,
          width: shrinkButtonAnimation.value,
          height: 60.0,
          decoration: BoxDecoration(color:Colors.greenAccent[700],
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

  @override
  _StartAnimationState createState() => _StartAnimationState();
}


class _StartAnimationState extends State<StartAnimation> {
  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      builder: widget._buildAnimation,
      animation: widget.buttonControler,
    );
  }
}

