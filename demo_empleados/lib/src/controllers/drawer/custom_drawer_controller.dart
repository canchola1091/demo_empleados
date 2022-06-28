
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController {

  showAdaptativeModals(BuildContext _context) {

    if(Platform.isIOS) {
      showCupertinoModalPopup(
        context: _context, 
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: Text('Camara'),
              onPressed: () {  },
            ),
            CupertinoActionSheetAction(
              child: Text('Galería'),
              onPressed: () {  },
            )
          ],
        )
      );
    }else {
      showModalBottomSheet(
            context: _context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              );
            },
          );

      // Get.bottomSheet(
      //   Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       TextButton(
      //         child: Text('Camara'),
      //         onPressed: () => print('Andorid'), 
      //       ),
      //       TextButton(
      //         child: Text('Camara'),
      //         onPressed: () => print('Andorid'), 
      //       )
      //     ],
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   clipBehavior: Clip.antiAlias,
      //   enterBottomSheetDuration: const Duration(milliseconds: 600),
      //   exitBottomSheetDuration: const Duration(milliseconds: 500),
      //   barrierColor: Colors.transparent
      // );
    }

  }

  
}