
import 'package:demo_empleados/src/controllers/drawer/custom_drawer_controller.dart';
import 'package:demo_empleados/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:demo_empleados/src/theme/theme.dart' as th;

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomDrawerController>(
      init: CustomDrawerController(),
      builder: (_) => SafeArea(
        bottom: false,
        child: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                color: th.primaryColor
              ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: FlutterLogo(size: 60.0),
                      ),
                      SizedBox(height: 20.0),
                      CustomText(
                        fTxt: 'USER NAME', //TODO: Agreagr nombre de usuario
                        fSize: 20.0,
                        fColor: Colors.white,
                      )
                    ]
                  )
                )
              ),
              const SizedBox(height: 30.0),
              InkWell(
                onTap: () => _.showAdaptativeModals(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.image,
                      color: th.secondaryColor,
                      size: 30.0,
                    ),
                    const SizedBox(width: 15.0),
                    CustomText(
                        fTxt: 'Settings', //TODO: Agreagr nombre de usuario
                        fSize: 22.0,
                        fColor: th.secondaryColor,
                      )
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}