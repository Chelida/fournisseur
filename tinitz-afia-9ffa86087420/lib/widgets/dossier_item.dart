// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

// Container dossierItems(
//     String item, String charge, DateTime dateString, String type,String agent,String ot,
//     {Color oddColour = Colors.white}) =>
//     Container(
//       decoration: BoxDecoration(color: oddColour),
//       padding:
//       EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5.0, right: 5.0),
//       child: Column(
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text("N° "+item,style: GoogleFonts.abel(
//                 textStyle: TextStyle(

//                 ),
//               )),
//               Text("N° BL: "+charge, style: GoogleFonts.abel(
//                 textStyle: TextStyle(

//                 ),
//               ),)
//             ],
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text("Agent : "+agent,
//                 style: GoogleFonts.abel(
//                     textStyle: TextStyle(
//                       color:Colors.grey,
//                     ),
//                   )
//               ),
//               Text("N° OT: "+ot, style: GoogleFonts.abel(
//                 textStyle: TextStyle(
//                   color:Colors.grey,
//                 ),
//               ))
//             ],
//           ),
//           SizedBox(
//             height: 3.0,
//           ),
//           Container(
//             width: Get.width,
//             height: 1,
//             color: Color(0xFF001e4d),
//           ),
//           SizedBox(
//             height: 3.0,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text("Date : ${DateFormat('dd - MM - yyyy').format(dateString)}",
//                   style: GoogleFonts.abel(
//                     textStyle: TextStyle(
//                       color:Colors.grey,
//                     ),
//                   )),
//               Text(type+" Conteneurs", style: GoogleFonts.abel(
//                 textStyle: TextStyle(
//                   color:Colors.grey,
//                 ),
//               ))
//             ],
//           ),
//         ],
//       ),
//     );