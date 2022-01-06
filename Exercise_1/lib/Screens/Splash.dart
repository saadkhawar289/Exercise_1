import 'package:flutter/material.dart';

import 'Map.dart';



class Splash extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MapScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(

            child: Column(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(child: Text('Aeasa',style: TextStyle(fontSize: 30),)),
                ),
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height*0.60,
            width:  MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/splash.png'), fit: BoxFit.fitWidth,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.40), BlendMode.darken))

            ),
          child: Center(child: Container(height:50,child: CircularProgressIndicator())),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}