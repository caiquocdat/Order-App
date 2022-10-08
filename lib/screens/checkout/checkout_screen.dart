import 'package:flutter/material.dart';
class CheckoutScreen extends StatelessWidget{
  static const String routeName='/checkout';
  static Route route(){
    return MaterialPageRoute(builder: (_)=>CheckoutScreen(),settings: RouteSettings(name: routeName));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Location')),
      body: Center(
        child: ElevatedButton(child: Text('Home Screen'),
          onPressed: (){
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
    );
  }
}