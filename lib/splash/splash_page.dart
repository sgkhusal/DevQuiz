import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2)).then((_) =>
        Navigator.pushReplacement( //se for só o push, consegue voltar para a splash
          context,
          MaterialPageRoute(
            builder: (context) => HomePage()
          )
        ));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear
          ),
          child: Center(
            child: Image.asset(AppImages.logo))
      ),
    );
  }
}
