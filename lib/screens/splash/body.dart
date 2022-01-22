import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 180,
            width: 170,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
              color: Colors.white,

            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Image.asset('assets/images/logoo.png',fit: BoxFit.cover,),
            ),
          ),
        ),
      ],
    );

  }
}
