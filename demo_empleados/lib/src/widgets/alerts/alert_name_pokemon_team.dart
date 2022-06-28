
// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/route_manager.dart';
// import 'package:demo_empleados/src/theme/theme.dart' as th;
// import 'package:demo_empleados/src/utils/utils.dart' as utils;
// import 'package:demo_empleados/src/validations/validations.dart';
// import 'package:demo_empleados/src/widgets/buttons/custom_button.dart';
// import 'package:demo_empleados/src/widgets/text/custom_text.dart';
// import 'package:demo_empleados/src/widgets/textfields/custom_textfield.dart';


// class AlertNamePokemonTeam extends StatelessWidget {
//   const AlertNamePokemonTeam({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PokemonesController>(
//       builder: (_) => FlipInX(
//         child: AlertDialog(
//           scrollable: true,
//           insetPadding: EdgeInsets.zero,
//           contentPadding: const EdgeInsets.all(0.0),
//           backgroundColor: Colors.transparent,
//           content: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(5.0)
//             ),
//             padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
//             width: utils.porcientoW(Get.context, 70),
//             child: Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Form(
//                     key: _.gxNameTeamKey,
//                     child: CustomTextField(
//                       textLabel: 'Nombre del equipo',
//                       fieldController: _.gxNameTeamCtrl,
//                       validation: (val) => Validations.validRequiredAndLength(val, 3),
//                     )
//                   ),
//                   const SizedBox(height: 25.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       CustomButton(
//                         width: utils.porcientoW(Get.context, 7.0),
//                         bgColor: Colors.white,
//                         borderColor: th.primaryColor,
//                         childWidget: CustomText(
//                           fTxt: 'ATRÁS',
//                           fSize: 15.0,
//                           fColor: th.primaryColor,
//                         ), 
//                         btnFunction: _.closeAlert
//                       ),
//                       CustomButton(
//                         width: utils.porcientoW(Get.context, 7.0),
//                         bgColor: th.primaryColor,
//                         childWidget: const CustomText(
//                           fTxt: 'ACEPTAR',
//                           fSize: 15.0,
//                           fColor: Colors.white
//                         ), 
//                         btnFunction: _.saveTeam
//                       )
//                     ]
//                   )
//                 ]
//               )
//             ) 
//           )
//         )
//       )
//     );
//   }
// }

