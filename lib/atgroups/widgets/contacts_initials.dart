// /// This is a widget to display the initials of an atsign which does not have a profile picture
// /// it takes in @param [size] as a double and
// /// @param [initials] as String and display those initials in a circular avatar with random colors

// import 'dart:math';
// import 'package:at_common_flutter/utils/text_styles.dart';
// import 'package:atfind/atgroups/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:at_common_flutter/services/size_config.dart';

// class ContactInitial extends StatelessWidget {
//   final double size;
//   final String? initials;

//   const ContactInitial({Key? key, this.size = 50, this.initials})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Random r = Random();
//     return Container(
//       height: size.toWidth,
//       width: size.toWidth,
//       decoration: BoxDecoration(
//         color:
//             Color.fromARGB(255, r.nextInt(255), r.nextInt(255), r.nextInt(255)),
//         borderRadius: BorderRadius.circular(size.toWidth),
//       ),
//       // border: Border.all(width: 0.5, color: ColorConstants.fontSecondary)),
//       child: Center(
//         child: Text(
//           initials!.toUpperCase(),
//           style: CustomTextStyles.primaryBold16(AllColors().WHITE),
//         ),
//       ),
//     );
//   }
// }
