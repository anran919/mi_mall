import 'package:flutter/material.dart';
import 'package:mi_mall/app/services/screen_adapter.dart';

class SxDiscount extends StatelessWidget {
  const SxDiscount({Key? key}) : super(key: key);

  Widget  getExpanded(context,index){
    return Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.all(ScreenAdapter.width(5)),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/sx$index.webp'),
                  Positioned(
                      bottom: 5,
                      child: Container(
                        width: ScreenAdapter.width(180),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.orange[900],
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          '省心价',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.fontSize),
                        ),
                      )),
                ],
              ),
              Text("¥2299元",style: TextStyle(color: Colors.orange[900],fontWeight: FontWeight.bold),)
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getExpanded(context, 1),
        getExpanded(context, 2),
        getExpanded(context, 3),
        getExpanded(context, 1),
      ],
    );
  }
}
